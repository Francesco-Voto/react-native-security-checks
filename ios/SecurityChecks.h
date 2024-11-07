
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNSecurityChecksSpec.h"

@interface SecurityChecks : NSObject <NativeSecurityChecksSpec>
#else
#import <React/RCTBridgeModule.h>

@interface SecurityChecks : NSObject <RCTBridgeModule>
#endif

@end
