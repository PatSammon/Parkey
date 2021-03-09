// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(RouteAlertIncidentCongestionInfo)
__attribute__((visibility ("default")))
@interface MBXRouteAlertIncidentCongestionInfo : NSObject

- (nonnull instancetype)initWithValue:(nullable NSNumber *)value
                          description:(nullable NSString *)description;

/** value of congestion: 0-100 */
@property (nonatomic, readonly, nullable) NSNumber *value;

/** This wont return at the moment, reserved for the future use */
@property (nonatomic, readonly, nullable, copy) NSString *description;


@end
