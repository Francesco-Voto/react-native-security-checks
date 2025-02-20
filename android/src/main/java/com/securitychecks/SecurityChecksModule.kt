package com.securitychecks

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = SecurityChecksModule.NAME)
class SecurityChecksModule(reactContext: ReactApplicationContext) :
    NativeSecurityChecksSpec(reactContext) {

    private var frida: FridaSecurityChecker = FridaSecurityChecker()
    private var numberOfChecks: Int = if (checkBuildConfig()) 3 else 2

    override fun getName(): String {
        return NAME
    }

    private fun checkBuildConfig(): Boolean {
        return (Build.MANUFACTURER.contains("Genymotion")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.toLowerCase().contains("droid4x")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.HARDWARE == "goldfish"
                || Build.HARDWARE == "vbox86"
                || Build.HARDWARE.toLowerCase().contains("nox")
                || Build.FINGERPRINT.startsWith("generic")
                || Build.PRODUCT == "sdk"
                || Build.PRODUCT == "google_sdk"
                || Build.PRODUCT == "sdk_x86"
                || Build.PRODUCT == "vbox86p"
                || Build.PRODUCT.toLowerCase().contains("nox")
                || Build.BOARD.toLowerCase().contains("nox")
                || (Build.BRAND.startsWith("generic") &&    Build.DEVICE.startsWith("generic")))
    }

    override fun isFridaDetected(): Boolean {
        return listOf(
            frida.isDetectedDevKeys,
            frida.isDetectedTestKeys,
            frida.isSuExists,
            frida.isFoundHooks,
            frida.isFoundXposed,
            frida.isFoundSuBinary,
            frida.isPermissiveSelinux,
            frida.isFoundResetProp,
            frida.isAccessedSuperuserApk,
            frida.isFoundDangerousProps,
            frida.isNotFoundReleaseKeys,
            frida.isFoundWrongPathPermission,
            frida.isFoundBusyboxBinary
        ).count { it } > numberOfChecks
    }

    companion object {
        const val NAME = "SecurityChecks"
    }
}
