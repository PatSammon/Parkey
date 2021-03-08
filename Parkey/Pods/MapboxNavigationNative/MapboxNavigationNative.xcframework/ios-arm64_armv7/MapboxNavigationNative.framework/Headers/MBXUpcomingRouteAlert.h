// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXRouteAlert;

NS_SWIFT_NAME(UpcomingRouteAlert)
__attribute__((visibility ("default")))
@interface MBXUpcomingRouteAlert : NSObject

- (nonnull instancetype)initWithAlert:(nonnull MBXRouteAlert *)alert
                      distanceToStart:(double)distanceToStart;

/** route alert */
@property (nonatomic, readonly, nonnull) MBXRouteAlert *alert;

/**
 * distance from current position to alert (m),
 * can be negative if it is a spanned alert and we are somewhere in the middle
 */
@property (nonatomic, readonly) double distanceToStart;


@end
