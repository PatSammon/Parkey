// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXRouteAlertType.h"
#import <CoreLocation/CoreLocation.h>

@class MBXRouteAlertBorderCrossingInfo;
@class MBXRouteAlertIncidentInfo;
@class MBXRouteAlertServiceAreaInfo;
@class MBXRouteAlertTollCollectionInfo;
@class MBXRouteAlertTunnelInfo;

NS_SWIFT_NAME(RouteAlert)
__attribute__((visibility ("default")))
@interface MBXRouteAlert : NSObject

- (nonnull instancetype)initWithType:(MBXRouteAlertType)type
                            distance:(double)distance
                              length:(nullable NSNumber *)length
                     beginCoordinate:(CLLocationCoordinate2D)beginCoordinate
                  beginGeometryIndex:(uint32_t)beginGeometryIndex
                       endCoordinate:(CLLocationCoordinate2D)endCoordinate
                    endGeometryIndex:(uint32_t)endGeometryIndex
                        incidentInfo:(nullable MBXRouteAlertIncidentInfo *)incidentInfo
                          tunnelInfo:(nullable MBXRouteAlertTunnelInfo *)tunnelInfo
                  borderCrossingInfo:(nullable MBXRouteAlertBorderCrossingInfo *)borderCrossingInfo
                  tollCollectionInfo:(nullable MBXRouteAlertTollCollectionInfo *)tollCollectionInfo
                     serviceAreaInfo:(nullable MBXRouteAlertServiceAreaInfo *)serviceAreaInfo;

/** type */
@property (nonatomic, readonly) MBXRouteAlertType type;

/** distance to route alert relative to start of route */
@property (nonatomic, readonly) double distance;

/** will be non-null for composite route alerts */
@property (nonatomic, readonly, nullable) NSNumber *length;

/** coordinate of route alert start */
@property (nonatomic, readonly) CLLocationCoordinate2D beginCoordinate;

/** index of route alert start in route geometry */
@property (nonatomic, readonly) uint32_t beginGeometryIndex;

/** coordinate of route alert end */
@property (nonatomic, readonly) CLLocationCoordinate2D endCoordinate;

/** index of route alert end in route geometry */
@property (nonatomic, readonly) uint32_t endGeometryIndex;

/** incident info if it's incident */
@property (nonatomic, readonly, nullable) MBXRouteAlertIncidentInfo *incidentInfo;

/** tunnel info if it's tunnel */
@property (nonatomic, readonly, nullable) MBXRouteAlertTunnelInfo *tunnelInfo;

/** border crossing info if it's border crossing */
@property (nonatomic, readonly, nullable) MBXRouteAlertBorderCrossingInfo *borderCrossingInfo;

/** toll collection info if it's toll collection */
@property (nonatomic, readonly, nullable) MBXRouteAlertTollCollectionInfo *tollCollectionInfo;

/** service area info it it's service area */
@property (nonatomic, readonly, nullable) MBXRouteAlertServiceAreaInfo *serviceAreaInfo;


@end
