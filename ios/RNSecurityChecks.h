
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNSecurityChecksSpec/RNSecurityChecksSpec.h"

@interface RNSecurityChecks : NSObject <NativeSecurityChecksSpec>
#else
#import <React/RCTBridgeModule.h>

@interface RNSecurityChecks : NSObject <RCTBridgeModule>
#endif

@end
