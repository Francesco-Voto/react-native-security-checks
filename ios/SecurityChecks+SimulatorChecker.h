#import <Foundation/Foundation.h>
#import "RNSecurityChecks.h"

NS_ASSUME_NONNULL_BEGIN

@interface RNSecurityChecks(SimulatorChecker)
+ (BOOL) isInSimulator;
@end

NS_ASSUME_NONNULL_END
