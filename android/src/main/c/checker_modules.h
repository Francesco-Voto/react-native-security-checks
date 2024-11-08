#include <stdbool.h>

#ifndef SECURITYCHECKS_CHECKER_MODULES_H
#define SECURITYCHECKS_CHECKER_MODULES_H

bool isDetectedTestKeys();

bool isDetectedDevKeys();

bool isNotFoundReleaseKeys();

bool isFoundDangerousProps();

bool isPermissiveSelinux();

bool isSuExists();

bool isAccessedSuperuserApk();

bool isFoundSuBinary();

bool isFoundBusyboxBinary();

bool isFoundXposed();

bool isFoundResetProp();

bool isFoundWrongPathPermission();

bool isFoundHooks();


#endif
