// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/** @brief NetworkStatus defines a set of connectivity statuses. */
// NOLINTNEXTLINE(modernize-use-using)
typedef NS_CLOSED_ENUM(NSInteger, MBXNetworkStatus)
{
    /** Not reachable via any devices */
    MBXNetworkStatusNotReachable,
    /** Reachable via WiFi */
    MBXNetworkStatusReachableViaWiFi,
    /** Reachable via Wireless Wide Area Network (WWAN) interface such as 3G or 4G. */
    MBXNetworkStatusReachableViaWWAN
} NS_SWIFT_NAME(NetworkStatus);
