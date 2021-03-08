// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXActiveGuidanceGeometryEncoding.h"
#import "MBXActiveGuidanceMode.h"

@class MBXWaypoint;

/** Declares additional parameters for setRoute method */
NS_SWIFT_NAME(ActiveGuidanceOptions)
__attribute__((visibility ("default")))
@interface MBXActiveGuidanceOptions : NSObject

- (nonnull instancetype)initWithMode:(MBXActiveGuidanceMode)mode
                    geometryEncoding:(MBXActiveGuidanceGeometryEncoding)geometryEncoding
                           waypoints:(nonnull NSArray<MBXWaypoint *> *)waypoints;

/** Indicates active guidance mode: driving, walking or cycling */
@property (nonatomic, readonly) MBXActiveGuidanceMode mode;

/** Indicates geometry encoding */
@property (nonatomic, readonly) MBXActiveGuidanceGeometryEncoding geometryEncoding;

/** Waypoints array in the given route to track remaining waypoints, including silent */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBXWaypoint *> *waypoints;


@end
