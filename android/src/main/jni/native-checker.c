#include <jni.h>
#include "../c/checker_modules.h"

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isDetectedTestKeys(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isDetectedTestKeys();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isDetectedDevKeys(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isDetectedDevKeys();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isNotFoundReleaseKeys(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isNotFoundReleaseKeys();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isFoundDangerousProps(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isFoundDangerousProps();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isPermissiveSelinux(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isPermissiveSelinux();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isSuExists(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isSuExists();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isAccessedSuperuserApk(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isAccessedSuperuserApk();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isFoundSuBinary(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isFoundSuBinary();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isFoundBusyboxBinary(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isFoundBusyboxBinary();
}


JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isFoundXposed(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isFoundXposed();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isFoundResetProp(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isFoundResetProp();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isFoundWrongPathPermission(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isFoundWrongPathPermission();
}

JNIEXPORT jboolean JNICALL
Java_com_securitychecks_FridaSecurityChecker_isFoundHooks(
        JNIEnv *env,
        jobject  this ) {

    return (jboolean) isFoundHooks();
}
