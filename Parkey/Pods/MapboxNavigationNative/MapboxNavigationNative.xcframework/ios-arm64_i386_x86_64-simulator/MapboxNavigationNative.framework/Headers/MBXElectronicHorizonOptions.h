// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(ElectronicHorizonOptions)
__attribute__((visibility ("default")))
@interface MBXElectronicHorizonOptions : NSObject

- (nonnull instancetype)initWithLength:(double)length
                     includeGeometries:(BOOL)includeGeometries
      doNotRecalculateInUncertainState:(BOOL)doNotRecalculateInUncertainState
            minTimeDeltaBetweenUpdates:(nullable NSNumber *)minTimeDeltaBetweenUpdates;

- (nonnull instancetype)initWithLength:(double)length
                             expansion:(uint8_t)expansion
                          branchLength:(double)branchLength
                     includeGeometries:(BOOL)includeGeometries
      doNotRecalculateInUncertainState:(BOOL)doNotRecalculateInUncertainState
            minTimeDeltaBetweenUpdates:(nullable NSNumber *)minTimeDeltaBetweenUpdates;

/** The minimum length of the EHorizon ahead of the current position. */
@property (nonatomic, readonly) double length;

/** The expansion strategy to be used. */
@property (nonatomic, readonly) uint8_t expansion;

/** The expansion strategy to be used. */
@property (nonatomic, readonly) double branchLength;

/** Flag to enable/disable geometries in the EHorizon. */
@property (nonatomic, readonly, getter=isIncludeGeometries) BOOL includeGeometries;

/**
 * if `true` in case of active guidance EH is never re-calculated
 * if puck is already not on the route, but we are still in tracking mode
 * (i.e. we are uncertain if we are off-route or not)
 * default is `true`
 */
@property (nonatomic, readonly, getter=isDoNotRecalculateInUncertainState) BOOL doNotRecalculateInUncertainState;

/**
 * minimum time which should pass between consecutive
 * navigation statuses to update electronic horizon (seconds)
 * if null we update electronic horizon on each navigation status
 */
@property (nonatomic, readonly, nullable) NSNumber *minTimeDeltaBetweenUpdates;


@end
