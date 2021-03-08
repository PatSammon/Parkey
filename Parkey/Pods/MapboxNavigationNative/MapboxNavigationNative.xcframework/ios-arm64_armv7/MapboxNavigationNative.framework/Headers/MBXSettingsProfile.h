// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXProfileApplication.h"
#import "MBXProfilePlatform.h"

NS_SWIFT_NAME(SettingsProfile)
__attribute__((visibility ("default")))
@interface MBXSettingsProfile : NSObject

- (nonnull instancetype)initWithApplication:(MBXProfileApplication)application
                                   platform:(MBXProfilePlatform)platform;

@property (nonatomic, readonly) MBXProfileApplication application;
@property (nonatomic, readonly) MBXProfilePlatform platform;

@end
