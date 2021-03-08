// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXRouteState.h"

@class MBXActiveGuidanceInfo;
@class MBXBannerInstruction;
@class MBXFixLocation;
@class MBXMapMatcherOutput;
@class MBXSpeedLimit;
@class MBXUpcomingRouteAlert;
@class MBXVoiceInstruction;

NS_SWIFT_NAME(NavigationStatus)
__attribute__((visibility ("default")))
@interface MBXNavigationStatus : NSObject

- (nonnull instancetype)initWithRouteState:(MBXRouteState)routeState
                                  location:(nonnull MBXFixLocation *)location
                                routeIndex:(uint32_t)routeIndex
                                  legIndex:(uint32_t)legIndex
                      remainingLegDistance:(float)remainingLegDistance
                      remainingLegDuration:(NSTimeInterval)remainingLegDuration
                                 stepIndex:(uint32_t)stepIndex
                     remainingStepDistance:(float)remainingStepDistance
                     remainingStepDuration:(NSTimeInterval)remainingStepDuration
                              stateMessage:(nonnull NSString *)stateMessage
                                  inTunnel:(BOOL)inTunnel
                                 predicted:(NSTimeInterval)predicted
                                shapeIndex:(uint32_t)shapeIndex
                         intersectionIndex:(uint32_t)intersectionIndex
                                  roadName:(nonnull NSString *)roadName
                          voiceInstruction:(nullable MBXVoiceInstruction *)voiceInstruction
                         bannerInstruction:(nullable MBXBannerInstruction *)bannerInstruction
                                speedLimit:(nullable MBXSpeedLimit *)speedLimit
                                key_points:(nonnull NSArray<MBXFixLocation *> *)key_points
                        map_matcher_output:(nonnull MBXMapMatcherOutput *)map_matcher_output
                              offRoadProba:(float)offRoadProba
                        activeGuidanceInfo:(nullable MBXActiveGuidanceInfo *)activeGuidanceInfo
                       upcomingRouteAlerts:(nonnull NSArray<MBXUpcomingRouteAlert *> *)upcomingRouteAlerts
                         nextWaypointIndex:(uint32_t)nextWaypointIndex;

@property (nonatomic, readonly) MBXRouteState routeState;
/** enhanced location */
@property (nonatomic, readonly, nonnull) MBXFixLocation *location;

/** index of route */
@property (nonatomic, readonly) uint32_t routeIndex;

/** index of current leg in route bounds */
@property (nonatomic, readonly) uint32_t legIndex;

/** remaining distance in current leg. DEPRECATED - use `activeGuidanceInfo` instead */
@property (nonatomic, readonly) float remainingLegDistance;

/** remaining duration in current leg. DEPRECATED - use `activeGuidanceInfo` instead */
@property (nonatomic, readonly) NSTimeInterval remainingLegDuration;

/** index of current step in leg bounds */
@property (nonatomic, readonly) uint32_t stepIndex;

/** remaining distance in current step. DEPRECATED - use `activeGuidanceInfo` instead */
@property (nonatomic, readonly) float remainingStepDistance;

/** remaining duration in current step. DEPRECATED - use `activeGuidanceInfo` instead */
@property (nonatomic, readonly) NSTimeInterval remainingStepDuration;

@property (nonatomic, readonly, nonnull, copy) NSString *stateMessage;
/** is current location belongs to tunnel */
@property (nonatomic, readonly, getter=isInTunnel) BOOL inTunnel;

@property (nonatomic, readonly) NSTimeInterval predicted;
/** index in leg shape */
@property (nonatomic, readonly) uint32_t shapeIndex;

/** index in step bounds(i.e. on each new step we start indexing from 0) */
@property (nonatomic, readonly) uint32_t intersectionIndex;

/** current road name */
@property (nonatomic, readonly, nonnull, copy) NSString *roadName;

/** voice instruction to be presented */
@property (nonatomic, readonly, nullable) MBXVoiceInstruction *voiceInstruction;

/** banner instruction to be presented */
@property (nonatomic, readonly, nullable) MBXBannerInstruction *bannerInstruction;

/** current speed limit */
@property (nonatomic, readonly, nullable) MBXSpeedLimit *speedLimit;

/**
 * Contains key points(for example corners) of route shape passed by pack between `getStatus` calls or from last notification of observer.
 * For now can be used in route mode only, always contain at least one point besides the very first `getStatus` call.
 * Only `coordinate`, ``bearing`, `monotonicTimestampNanoseconds` and `time` fields are filled. Last point is always the same as `location`.
 */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBXFixLocation *> *key_points;

/** Output of map matcher on this status. */
@property (nonatomic, readonly, nonnull) MBXMapMatcherOutput *map_matcher_output;

/**
 * Probability of vehicle to be off-road:
 * 1.0 - vehicle is definitely off-road, 0.0 - vehicle is definitely on-road
 */
@property (nonatomic, readonly) float offRoadProba;

/** Will be empty if we are in free-drive now(i.e. routeState == invalid) */
@property (nonatomic, readonly, nullable) MBXActiveGuidanceInfo *activeGuidanceInfo;

/** Array of upcoming route alerts, doesn't contain route alerts that were already passed by user */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBXUpcomingRouteAlert *> *upcomingRouteAlerts;

/** Index of next waypoint on the route in the initial list of waypoints. If no waypoints - 0 */
@property (nonatomic, readonly) uint32_t nextWaypointIndex;


@end
