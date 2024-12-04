#import "SecurityChecks+Frida.h"
#import "SecurityChecks+SimulatorChecker.h"
#import <mach-o/dyld.h>
#import <objc/runtime.h>

@implementation SecurityChecks (Frida)

+ (BOOL) isFrida {
  if ([SecurityChecks hasCydiaInstalled]) {
    return YES;
  }
  if ([SecurityChecks hasUndecimusInstalled]) {
    return YES;
  }
  if ([SecurityChecks hasSileoInstalled]) {
    return YES;
  }
  if ([SecurityChecks hasZbraInstalled]) {
    return YES;
  }
  if ([SecurityChecks isContainsSuspiciousApps]) {
    return YES;
  }
  if ([SecurityChecks checkDYLD]) {
    return YES;
  }
  if ([SecurityChecks checkSuspiciousObjCClasses]) {
    return YES;
  }
  if ([SecurityChecks isSuspiciousSystemPathsExists]) {
    return YES;
  }
  return [SecurityChecks canEditSystemFiles];
  
}

+ (BOOL)hasCydiaInstalled {
  return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]];
}

+ (BOOL)hasUndecimusInstalled {
  return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"undecimus://"]];
}

+ (BOOL)hasSileoInstalled {
  return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sileo://"]];
}

+ (BOOL)hasZbraInstalled {
  return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"zbra://"]];
}


+ (BOOL)isContainsSuspiciousApps {
  NSArray *suspiciousAppsPathToCheck = @[
    @"/Applications/Cydia.app",
    @"/Applications/blackra1n.app",
    @"/Applications/FakeCarrier.app",
    @"/Applications/Icy.app",
    @"/Applications/IntelliScreen.app",
    @"/Applications/MxTube.app",
    @"/Applications/RockApp.app",
    @"/Applications/SBSettings.app",
    @"/Applications/WinterBoard.app",
    @"/Applications/Shadow.app",
    @"/Applications/IntelliScreen.app",
    @"/Applications/Sileo.app",
    @"/Applications/FlyJB.app",
    @"/Applications/Zebra.app"
  ];
  
  for (NSString *path in suspiciousAppsPathToCheck) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      return YES;
    }
  }
  return NO;
}

+ (BOOL)isSuspiciousSystemPathsExists {
  NSMutableArray *suspiciousSystemPathsToCheck = [NSMutableArray arrayWithObjects:
    @"/var/mobile/Library/Preferences/ABPattern", // A-Bypass
    @"/usr/lib/ABDYLD.dylib", // A-Bypass,
    @"/usr/lib/ABSubLoader.dylib", // A-Bypass
    @"/usr/sbin/frida-server", // frida
    @"/etc/apt/sources.list.d/electra.list", // electra
    @"/etc/apt/sources.list.d/sileo.sources", // electra
    @"/.bootstrapped_electra", // electra
    @"/usr/lib/libjailbreak.dylib", // electra
    @"/jb/lzma", // electra
    @"/.cydia_no_stash", // unc0ver
    @"/.installed_unc0ver", // unc0ver
    @"/jb/offsets.plist", // unc0ver
    @"/usr/share/jailbreak/injectme.plist", // unc0ver
    @"/etc/apt/undecimus/undecimus.list", // unc0ver
    @"/var/lib/dpkg/info/mobilesubstrate.md5sums", // unc0ver
    @"/Library/MobileSubstrate/MobileSubstrate.dylib",
    @"/jb/jailbreakd.plist", // unc0ver
    @"/jb/amfid_payload.dylib", // unc0ver
    @"/jb/libjailbreak.dylib", // unc0ver
    @"/usr/libexec/cydia/firmware.sh",
    @"/var/lib/cydia",
    @"/etc/apt",
    @"/private/var/lib/apt",
    @"/private/var/Users/",
    @"/var/log/apt",
    @"/Applications/Cydia.app",
    @"/private/var/stash",
    @"/private/var/lib/apt/",
    @"/private/var/lib/cydia",
    @"/private/var/cache/apt/",
    @"/private/var/log/syslog",
    @"/private/var/tmp/cydia.log",
    @"/Applications/Icy.app",
    @"/Applications/MxTube.app",
    @"/Applications/RockApp.app",
    @"/Applications/blackra1n.app",
    @"/Applications/SBSettings.app",
    @"/Applications/FakeCarrier.app",
    @"/Applications/WinterBoard.app",
    @"/Applications/IntelliScreen.app",
    @"/private/var/mobile/Library/SBSettings/Themes",
    @"/Library/MobileSubstrate/CydiaSubstrate.dylib",
    @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
    @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
    @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
    @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
    @"/Applications/Sileo.app",
    @"/var/binpack",
    @"/Library/PreferenceBundles/LibertyPref.bundle",
    @"/Library/PreferenceBundles/ShadowPreferences.bundle",
    @"/Library/PreferenceBundles/ABypassPrefs.bundle",
    @"/Library/PreferenceBundles/FlyJBPrefs.bundle",
    @"/Library/PreferenceBundles/Cephei.bundle",
    @"/Library/PreferenceBundles/SubstitutePrefs.bundle",
    @"/Library/PreferenceBundles/libhbangprefs.bundle",
    @"/usr/lib/libhooker.dylib",
    @"/usr/lib/libsubstitute.dylib",
    @"/usr/lib/substrate",
    @"/usr/lib/TweakInject",
    @"/var/binpack/Applications/loader.app", // checkra1n
    @"/Applications/FlyJB.app", // Fly JB X
    @"/Applications/Zebra.app", // Zebra
    @"/Library/BawAppie/ABypass", // ABypass
    @"/Library/MobileSubstrate/DynamicLibraries/SSLKillSwitch2.plist", // SSL Killswitch
    @"/Library/MobileSubstrate/DynamicLibraries/PreferenceLoader.plist", // PreferenceLoader
    @"/Library/MobileSubstrate/DynamicLibraries/PreferenceLoader.dylib", // PreferenceLoader
    @"/Library/MobileSubstrate/DynamicLibraries", // DynamicLibraries directory in general
    @"/var/mobile/Library/Preferences/me.jjolano.shadow.plist",
    nil
  ];
  
  if (![SecurityChecks isInSimulator]) {
    [suspiciousSystemPathsToCheck addObjectsFromArray: @[
      @"/bin/bash",
      @"/usr/sbin/sshd",
      @"/usr/libexec/ssh-keysign",
      @"/bin/sh",
      @"/etc/ssh/sshd_config",
      @"/usr/libexec/sftp-server",
      @"/usr/bin/ssh"
    ]];
  }
  
  for (NSString *path in suspiciousSystemPathsToCheck) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      return YES;
    }
  }
  return NO;
}

+ (BOOL)canEditSystemFiles {
  NSString *jailBreakText = @"Developer Insider";
  NSError *error = nil;
  BOOL success = [jailBreakText writeToFile:jailBreakText atomically:YES encoding:NSUTF8StringEncoding error:&error];
  return success;
}

+ (BOOL)checkDYLD {
  NSArray *suspiciousLibraries = @[
    @"SubstrateLoader.dylib",
    @"SSLKillSwitch2.dylib",
    @"SSLKillSwitch.dylib",
    @"MobileSubstrate.dylib",
    @"TweakInject.dylib",
    @"CydiaSubstrate",
    @"cynject",
    @"CustomWidgetIcons",
    @"PreferenceLoader",
    @"RocketBootstrap",
    @"WeeLoader",
    @"/.file", // HideJB (2.1.1) changes full paths of the suspicious libraries to "/.file"
    @"libhooker",
    @"SubstrateInserter",
    @"SubstrateBootstrap",
    @"ABypass",
    @"FlyJB",
    @"Substitute",
    @"Cephei",
    @"Electra",
    @"AppSyncUnified-FrontBoard.dylib",
    @"Shadow",
    @"FridaGadget",
    @"frida",
    @"libcycript"
  ];
  
  uint32_t count = _dyld_image_count();
  for (uint32_t i = 0; i < count; i++) {
    const char *imageName = _dyld_get_image_name(i);
    NSString *imageNameStr = [NSString stringWithUTF8String:imageName];
    
    for (NSString *library in suspiciousLibraries) {
      if ([imageNameStr localizedCaseInsensitiveContainsString:library]) {
        return YES;
      }
    }
  }
  return NO;
}

+ (BOOL)checkSuspiciousObjCClasses {
  Class shadowRulesetClass = objc_getClass("ShadowRuleset");
  SEL selector = NSSelectorFromString(@"internalDictionary");
  if (class_getInstanceMethod(shadowRulesetClass, selector) != nil) {
    return YES;
  }
  return NO;
}

@end




