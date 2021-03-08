// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXNavigationStatusOrigin.h"

@class MBXNavigationStatus;

@class MBXPeerWrapper;

NS_SWIFT_NAME(NavigatorObserver)
@protocol MBXNavigatorObserver
/**
 * There are several cases when it can be called:
 * 1. After receiving new raw location via `updateLocation`
 * 2. After transition to active guidance via `setRoute/changeRouteLeg` methods (at least one raw location should be received before)
 * 3. Unconditionally if we have no raw locations for some significant amount of time (controlled via `unconditionalStatusPollingPatienceSeconds` and `unconditionalStatusPollingIntervalSeconds` fields in config)
 *
 * NB: There is no guarantee about thread where it can be called. So, synchronization is up to SDK.
 */
- (void)onStatusForOrigin:(MBXNavigationStatusOrigin)origin
                   status:(nonnull MBXNavigationStatus *)status;

@property (nonatomic, nullable, readwrite) MBXPeerWrapper *peer;
@end
