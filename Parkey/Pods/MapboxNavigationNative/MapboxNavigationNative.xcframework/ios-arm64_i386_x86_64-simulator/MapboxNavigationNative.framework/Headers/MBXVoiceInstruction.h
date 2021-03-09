// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(VoiceInstruction)
__attribute__((visibility ("default")))
@interface MBXVoiceInstruction : NSObject

- (nonnull instancetype)initWithSsmlAnnouncement:(nonnull NSString *)ssmlAnnouncement
                                    announcement:(nonnull NSString *)announcement
                           remainingStepDistance:(float)remainingStepDistance
                                           index:(uint32_t)index;

@property (nonatomic, readonly, nonnull, copy) NSString *ssmlAnnouncement;
@property (nonatomic, readonly, nonnull, copy) NSString *announcement;
@property (nonatomic, readonly) float remainingStepDistance;
@property (nonatomic, readonly) uint32_t index;

@end
