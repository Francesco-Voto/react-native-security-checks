#import <Foundation/Foundation.h>
#import "SecurityChecks.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecurityChecks(SimulatorChecker)
+ (BOOL) isInSimulator;
@end

NS_ASSUME_NONNULL_END
