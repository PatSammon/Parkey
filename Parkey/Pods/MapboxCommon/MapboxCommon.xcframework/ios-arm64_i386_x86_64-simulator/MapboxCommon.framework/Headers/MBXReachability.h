#import <Foundation/Foundation.h>

#import "MapboxReachability.h"

__attribute__((visibility ("default")))
@interface MBXReachability : NSObject <MBXReachabilityInterface>
- (instancetype _Nonnull )init NS_UNAVAILABLE;
- (instancetype _Nonnull )initWithHostname:(NSString * __nullable)hostname;
@end
