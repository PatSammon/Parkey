// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXConfigHandle;
@class MBXNavigatorConfig;
@class MBXSettingsProfile;

NS_SWIFT_NAME(ConfigFactory)
__attribute__((visibility ("default")))
@interface MBXConfigFactory : NSObject

/**
 * @param profile       Indication for a settings profile for default
 * @param config        Config with well-established parameters suitable for most of the users
 * @param customConfig  JSON with parameters that may override some defaults from a profile
 */
+ (nonnull MBXConfigHandle *)buildForProfile:(nonnull MBXSettingsProfile *)profile
                                      config:(nonnull MBXNavigatorConfig *)config
                                customConfig:(nonnull NSString *)customConfig __attribute((ns_returns_retained));

@end
