// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(ActiveGuidanceProgress)
__attribute__((visibility ("default")))
@interface MBXActiveGuidanceProgress : NSObject

- (nonnull instancetype)initWithDistanceTraveled:(double)distanceTraveled
                                fractionTraveled:(double)fractionTraveled
                               remainingDistance:(double)remainingDistance
                               remainingDuration:(NSTimeInterval)remainingDuration;

/** How much meters we traveled from the start of route/leg/step */
@property (nonatomic, readonly) double distanceTraveled;

/** Fraction of traveled distance, i.e. `distanceTraveled` / `total route/leg/step distance` */
@property (nonatomic, readonly) double fractionTraveled;

/** remaining distance in meters to the end of route/leg/step */
@property (nonatomic, readonly) double remainingDistance;

/** remaining duration to the end of route/leg/step */
@property (nonatomic, readonly) NSTimeInterval remainingDuration;


@end
