// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class MBXPeerWrapper;

NS_SWIFT_NAME(LocationObserver)
@protocol MBXLocationObserver
/** Called when Navigator receive new location after 'updateLocation' */
- (void)onLocationChangedForLocation:(CLLocationCoordinate2D)location;

@property (nonatomic, nullable, readwrite) MBXPeerWrapper *peer;
@end
