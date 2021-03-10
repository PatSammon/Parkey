// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXOfflineDataDomain.h"
#import "MBXOfflineServiceListAvailableRegionsCallback.h"

@class MBXOfflineDataRegionMetadata;
@class MBXOfflineService;
@class MBXOfflineServiceOptions;
@protocol MBXOfflineServiceObserver;

/**
 * A singleton class that allows querying the server for available offline regions, as well as downloading offline packs to
 * disk. Observers attached to this object get notified when the status of an offline pack changes (e.g. when a new one is
 * downloaded).
 */
NS_SWIFT_NAME(OfflineService)
__attribute__((visibility ("default")))
@interface MBXOfflineService : NSObject

/**
 * @brief Obtains a reference to the OfflineService.
 *
 * OfflineService is a singleton. Calling this function with values that are different from those
 * of the first call is an error.
 *
 * @param path Path on disk where offline packs are stored.
 * @param options Configuration options for accessing the Offline Data API.
 */
+ (nonnull MBXOfflineService *)getInstanceForPath:(nonnull NSString *)path
                                          options:(nonnull MBXOfflineServiceOptions *)options __attribute((ns_returns_retained));
/**
 * @brief Add an observer that gets events as region state changes.
 *
 * @param observer An object implementing the observer interface.
 */
+ (void)registerObserverForObserver:(nonnull id<MBXOfflineServiceObserver>)observer;
/**
 * @brief Removes an observer.
 *
 * @param observer The observer that should be removed.
 */
+ (void)unregisterObserverForObserver:(nonnull id<MBXOfflineServiceObserver>)observer;
/**
 * @brief Queries the Offline Data API and lists all available regions
 *
 * Only lists regions that are compatible with the current format.
 *
 * @param callback Callback function that will be called with the result.
 */
- (void)listAvailableRegionsForCallback:(nonnull MBXOfflineServiceListAvailableRegionsCallback)callback;
/**
 * @brief Starts the download of a pack
 *
 * If a pack with the same metadata is already being downloaded, nothing will happen. If the metadata is different,
 * that download will be canceled, and a new download will be started. If the downloaded pack with this ID is
 * already complete, a new download will be started if the revision is different.
 *
 * @param domain A flag indicating whether the Maps or Navigation pack should be downloaded.
 * @param metadata The offline region to be downloaded
 */
- (void)downloadPackForDomain:(MBXOfflineDataDomain)domain
                     metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata;
/**
 * @brief Cancels a pack download
 *
 * Cancellation is done via the string ID because downloads can be started from multiple places.
 *
 * @param domain A flag indicating whether the Maps or Navigation pack should be canceled.
 * @param metadata The offline region to be canceled
 */
- (void)cancelPackDownloadForDomain:(MBXOfflineDataDomain)domain
                           metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata;
/**
 * @brief Deletes a region
 *
 * Cancels active region downloads and deletes existing regions with this id.
 *
 * @param domain A flag indicating whether the Maps or Navigation pack should be deleted.
 * @param metadata The offline region to be deleted
 */
- (void)deletePackForDomain:(MBXOfflineDataDomain)domain
                   metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata;

@end
