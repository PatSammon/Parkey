// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXElectronicHorizonOptions;
@class MBXPollingConfig;

NS_SWIFT_NAME(NavigatorConfig)
__attribute__((visibility ("default")))
@interface MBXNavigatorConfig : NSObject

- (nonnull instancetype)initWithVoiceInstructionThreshold:(nullable NSNumber *)voiceInstructionThreshold
                                 electronicHorizonOptions:(nullable MBXElectronicHorizonOptions *)electronicHorizonOptions
                                                  polling:(nullable MBXPollingConfig *)polling;

/**
 * The threshold at which we will return a voice instruction after current progress has passed it.
 * Pass null to use default value.
 */
@property (nonatomic, readwrite, nullable) NSNumber *voiceInstructionThreshold;

@property (nonatomic, readwrite, nullable) MBXElectronicHorizonOptions *electronicHorizonOptions;
/** configuration of status polling */
@property (nonatomic, readwrite, nullable) MBXPollingConfig *polling;


@end
