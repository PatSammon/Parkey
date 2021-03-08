// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_SWIFT_NAME(FixLocation)
__attribute__((visibility ("default")))
@interface MBXFixLocation : NSObject

- (nonnull instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate
             monotonicTimestampNanoseconds:(int64_t)monotonicTimestampNanoseconds
                                      time:(nonnull NSDate *)time
                                     speed:(nullable NSNumber *)speed
                                   bearing:(nullable NSNumber *)bearing
                                  altitude:(nullable NSNumber *)altitude
                        accuracyHorizontal:(nullable NSNumber *)accuracyHorizontal
                                  provider:(nullable NSString *)provider
                           bearingAccuracy:(nullable NSNumber *)bearingAccuracy
                             speedAccuracy:(nullable NSNumber *)speedAccuracy
                          verticalAccuracy:(nullable NSNumber *)verticalAccuracy;

/** A coordinate value as defined by mapbox-bindgen (lon, lat) */
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

/**
 * Monotonic(i.e. every new timestamp is greater than previous one) timestamp corresponding to this location.
 * If on some platform monotonic time is not provided by system then using of non-monotonic clock is allowed.
 * If this value is greater than zero getStatus(u64) must be used instead of getStatus(timestamp).
 * Measured in nanoseconds.
 */
@property (nonatomic, readonly) int64_t monotonicTimestampNanoseconds;

/** A timestamp value as defined by mapbox-bindgen */
@property (nonatomic, readonly, nonnull) NSDate *time;

/** The speed at which the device is moving in meters/second */
@property (nonatomic, readonly, nullable) NSNumber *speed;

/** The direction in which the device is traveling in degrees relative to due north */
@property (nonatomic, readonly, nullable) NSNumber *bearing;

/** The altitude of the device in meters above the WGS84 ellipsoid */
@property (nonatomic, readonly, nullable) NSNumber *altitude;

/** The estimated horizontal accuracy of the location, radial, in meters */
@property (nonatomic, readonly, nullable) NSNumber *accuracyHorizontal;

/** The provider of this location */
@property (nonatomic, readonly, nullable, copy) NSString *provider;

/** The estimated bearing accuracy of this location, in degrees */
@property (nonatomic, readonly, nullable) NSNumber *bearingAccuracy;

/** The estimated speed accuracy of this location, in meters per second */
@property (nonatomic, readonly, nullable) NSNumber *speedAccuracy;

/** The estimated vertical accuracy of this location, in meters */
@property (nonatomic, readonly, nullable) NSNumber *verticalAccuracy;


@end
