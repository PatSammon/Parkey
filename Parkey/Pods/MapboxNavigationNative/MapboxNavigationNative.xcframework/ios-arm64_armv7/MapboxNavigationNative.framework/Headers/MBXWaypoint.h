// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/**
 * Declates a waypoint for the route. Silent means no breaking into legs in this point
 *  and no notigfication.
 */
NS_SWIFT_NAME(Waypoint)
__attribute__((visibility ("default")))
@interface MBXWaypoint : NSObject

- (nonnull instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                                  isSilent:(BOOL)isSilent;

/** A coordinate value as defined by mapbox-bindgen (lon, lat) */
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

/**
 * Silent waypoint doesn't break the route part to legs but must be visited.
 * No alert on reaching silent endpoint.
 */
@property (nonatomic, readonly, getter=isIsSilent) BOOL isSilent;


@end
