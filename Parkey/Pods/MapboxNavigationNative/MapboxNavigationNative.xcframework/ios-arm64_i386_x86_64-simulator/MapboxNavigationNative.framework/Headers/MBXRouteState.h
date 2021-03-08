// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

// NOLINTNEXTLINE(modernize-use-using)
typedef NS_CLOSED_ENUM(NSInteger, MBXRouteState)
{
    /**
     * We have no route.
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are INVALID.
     */
    MBXRouteStateInvalid,
    /**
     * We have initialized route, but haven't started route tracking yet: all route-related fields are valid
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBXRouteStateInitialized,
    /**
     * We are on the route: all route-related fields are valid
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBXRouteStateTracking,
    /**
     * We've approached to route end: route will be automatically reset (i.e. next `RouteState` is `invalid`)
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBXRouteStateComplete,
    /**
     * We've gone of route: route will be automatically reset (i.e. next `RouteState` is `invalid`)
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are INVALID.
     */
    MBXRouteStateOffRoute,
    /**
     * We didn't have updates for too much time and route-related fields can be stale.
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBXRouteStateStale,
    /**
     * We are probably about to go off-route.
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBXRouteStateUncertain
} NS_SWIFT_NAME(RouteState);
