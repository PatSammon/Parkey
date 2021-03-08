// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@protocol MBXReachabilityInterface;

/**
 * @brief A factory class used to instantiate a platform-specific interface to
 * monitor network reachability.
 */
NS_SWIFT_NAME(ReachabilityFactory)
__attribute__((visibility ("default")))
@interface MBXReachabilityFactory : NSObject

/**
 * @brief A factory method used to instantiate a platform-specific interface
 * to monitor network reachability.
 * @param hostname Optional hostname to monitor
 * @return A reachability interface
 */
+ (nonnull id<MBXReachabilityInterface>)reachabilityForHostname:(nullable NSString *)hostname __attribute((ns_returns_retained));

@end
