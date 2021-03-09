// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXBannerSection;

NS_SWIFT_NAME(BannerInstruction)
__attribute__((visibility ("default")))
@interface MBXBannerInstruction : NSObject

- (nonnull instancetype)initWithPrimary:(nonnull MBXBannerSection *)primary
                                   view:(nullable MBXBannerSection *)view
                              secondary:(nullable MBXBannerSection *)secondary
                                    sub:(nullable MBXBannerSection *)sub
                  remainingStepDistance:(float)remainingStepDistance
                                  index:(uint32_t)index;

@property (nonatomic, readonly, nonnull) MBXBannerSection *primary;
/** A guidance view that provides visual guidance to the user. */
@property (nonatomic, readonly, nullable) MBXBannerSection *view;

@property (nonatomic, readonly, nullable) MBXBannerSection *secondary;
@property (nonatomic, readonly, nullable) MBXBannerSection *sub;
@property (nonatomic, readonly) float remainingStepDistance;
@property (nonatomic, readonly) uint32_t index;

@end
