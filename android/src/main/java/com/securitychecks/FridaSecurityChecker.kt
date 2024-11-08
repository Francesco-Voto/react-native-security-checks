package com.securitychecks


class FridaSecurityChecker {

    val isDetectedDevKeys: Boolean
      external get

    val isDetectedTestKeys: Boolean
      external get

    val isNotFoundReleaseKeys: Boolean
      external get

    val isFoundDangerousProps: Boolean
      external get

    val isPermissiveSelinux: Boolean
      external get

    val isSuExists: Boolean
      external get

    val isAccessedSuperuserApk: Boolean
      external get

    val isFoundSuBinary: Boolean
      external get

    val isFoundBusyboxBinary: Boolean
      external get

    val isFoundXposed: Boolean
      external get

    val isFoundResetProp: Boolean
      external get

    val isFoundWrongPathPermission: Boolean
      external get

    val isFoundHooks: Boolean
      external get


    companion object {
      private const val LIB_NAME = "native-checker"

      init {
        System.loadLibrary(LIB_NAME)
      }

    }
}
