// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXSpeedLimitSign.h"
#import "MBXSpeedLimitUnit.h"

NS_SWIFT_NAME(SpeedLimit)
__attribute__((visibility ("default")))
@interface MBXSpeedLimit : NSObject

- (nonnull instancetype)initWithSpeedKmph:(nullable NSNumber *)speedKmph
                               localeUnit:(MBXSpeedLimitUnit)localeUnit
                               localeSign:(MBXSpeedLimitSign)localeSign;

/** speed in kilometres per hour */
@property (nonatomic, readonly, nullable) NSNumber *speedKmph;

/** default unit */
@property (nonatomic, readonly) MBXSpeedLimitUnit localeUnit;

/** default sign */
@property (nonatomic, readonly) MBXSpeedLimitSign localeSign;


@end
