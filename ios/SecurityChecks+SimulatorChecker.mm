#import "SecurityChecks+SimulatorChecker.h"


@implementation SecurityChecks (SimulatorChecker)

+ (BOOL) isInSimulator {
  return TARGET_OS_SIMULATOR != 0;
  
}


@end

