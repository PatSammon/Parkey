// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXActiveGuidanceProgress;

NS_SWIFT_NAME(ActiveGuidanceInfo)
__attribute__((visibility ("default")))
@interface MBXActiveGuidanceInfo : NSObject

- (nonnull instancetype)initWithRouteProgress:(nonnull MBXActiveGuidanceProgress *)routeProgress
                                  legProgress:(nonnull MBXActiveGuidanceProgress *)legProgress
                                 stepProgress:(nonnull MBXActiveGuidanceProgress *)stepProgress;

/** Progress of current route */
@property (nonatomic, readonly, nonnull) MBXActiveGuidanceProgress *routeProgress;

/** Progress of current leg */
@property (nonatomic, readonly, nonnull) MBXActiveGuidanceProgress *legProgress;

/** Progress of current step */
@property (nonatomic, readonly, nonnull) MBXActiveGuidanceProgress *stepProgress;


@end
