#import "SecurityChecks+SimulatorChecker.h"


@implementation RNSecurityChecks (SimulatorChecker)

+ (BOOL) isInSimulator {
  return TARGET_OS_SIMULATOR != 0;
  
}


@end

