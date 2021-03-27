// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXNetworkStatus.h"
#import "MBXReachabilityChanged.h"

@class MBXPeerWrapper;

NS_SWIFT_NAME(ReachabilityInterface)
@protocol MBXReachabilityInterface
/**
 * @brief Adds a new listener.
 * The listener will be called immediately with the current network status.
 * @param listener The callback to receive the update.
 */
- (void)addListenerForListener:(nonnull MBXReachabilityChanged)listener;
/** @brief Indicates whether the host is reachable or not. */
- (BOOL)isReachable;
/** @brief Gets the current network status */
- (MBXNetworkStatus)currentNetworkStatus;
/** @brief Starts listening for changes to network reachability. */
- (void)start;
/** @brief Stops listening for changes to network reachability. */
- (void)stop;

@property (nonatomic, nullable, readwrite) MBXPeerWrapper *peer;
@end
