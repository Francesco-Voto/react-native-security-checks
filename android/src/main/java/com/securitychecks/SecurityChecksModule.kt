package com.securitychecks

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = SecurityChecksModule.NAME)
class SecurityChecksModule(reactContext: ReactApplicationContext) :
    NativeSecurityChecksSpec(reactContext) {

    private var frida: FridaSecurityChecker = FridaSecurityChecker()

    override fun getName(): String {
        return NAME
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
        ).count { it } > 2
    }

    companion object {
        const val NAME = "SecurityChecks"
    }
}
