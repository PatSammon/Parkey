// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXRouteAlertAdminInfo;

NS_SWIFT_NAME(RouteAlertBorderCrossingInfo)
__attribute__((visibility ("default")))
@interface MBXRouteAlertBorderCrossingInfo : NSObject

- (nonnull instancetype)initWithFrom:(nonnull MBXRouteAlertAdminInfo *)from
                                  to:(nonnull MBXRouteAlertAdminInfo *)to;

@property (nonatomic, readonly, nonnull) MBXRouteAlertAdminInfo *from;
@property (nonatomic, readonly, nonnull) MBXRouteAlertAdminInfo *to;

@end
