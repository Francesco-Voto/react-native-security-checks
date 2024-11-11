#import <Foundation/Foundation.h>
#import "RNSecurityChecks.h"

NS_ASSUME_NONNULL_BEGIN

@interface RNSecurityChecks(Frida)
+ (BOOL) isFrida;
@end

NS_ASSUME_NONNULL_END
