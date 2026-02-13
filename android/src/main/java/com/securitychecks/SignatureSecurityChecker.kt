package com.securitychecks

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.os.Build
import java.io.ByteArrayInputStream
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException
import java.security.cert.CertificateException
import java.security.cert.CertificateFactory

class SignatureSecurityChecker(val context: Context) {

  @Throws(CertificateException::class, NoSuchAlgorithmException::class)
  private fun calculateSignatureHash(signatureBytes: ByteArray): String {
    val cf = CertificateFactory.getInstance("X.509")
    val cert = cf.generateCertificate(ByteArrayInputStream(signatureBytes))

    val md = MessageDigest.getInstance("SHA-256")
    val hashBytes = md.digest(cert.encoded)

    return bytesToHex(hashBytes)
  }

  private fun bytesToHex(bytes: ByteArray): String {
    val sb = StringBuilder()
    for (b in bytes) {
      sb.append(String.format("%02x", b))
    }
    return sb.toString()
  }

  @Throws(
    PackageManager.NameNotFoundException::class,
    NoSuchAlgorithmException::class,
    CertificateException::class
  )
  private fun getAppSignature(): String {
    val packageInfo: PackageInfo

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
      packageInfo = context.packageManager.getPackageInfo(
        context.packageName,
        PackageManager.GET_SIGNING_CERTIFICATES
      )
      val signatures: Array<Signature> = if (packageInfo.signingInfo!!.hasMultipleSigners()) {
        packageInfo.signingInfo!!.apkContentsSigners
      } else {
        packageInfo.signingInfo!!.signingCertificateHistory
      }

      return calculateSignatureHash(signatures[0].toByteArray())
    } else {
      packageInfo = context.packageManager.getPackageInfo(
        context.packageName,
        PackageManager.GET_SIGNATURES
      )

      return calculateSignatureHash(packageInfo.signatures!![0].toByteArray())
    }
  }

  fun verifyAppSignature(originalSignatureHash: String): Boolean {
      val currentSignature = getAppSignature()
      return originalSignatureHash == currentSignature
  }

}
