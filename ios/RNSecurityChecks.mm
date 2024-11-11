#import "RNSecurityChecks.h"
#import "SecurityChecks+Frida.h"

@implementation RNSecurityChecks
RCT_EXPORT_MODULE()
- (NSNumber *)isFridaDetected {
  return [RNSecurityChecks isFrida] ? @YES : @NO;
}


#ifdef RCT_NEW_ARCH_ENABLED

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeSecurityChecksSpecJSI>(params);
}
#endif



@end
