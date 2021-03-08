// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXOfflineDataDomain.h"
#import "MBXOfflineDataPackAcknowledgeCallback.h"

@class MBXOfflineDataPack;
@class MBXOfflineDataRegionMetadata;

@class MBXPeerWrapper;

NS_SWIFT_NAME(OfflineServiceObserver)
@protocol MBXOfflineServiceObserver
- (void)onPendingForDomain:(MBXOfflineDataDomain)domain
                  metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata
                      pack:(nonnull MBXOfflineDataPack *)pack;
- (void)onDownloadingForDomain:(MBXOfflineDataDomain)domain
                      metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata
                          pack:(nonnull MBXOfflineDataPack *)pack;
- (void)onIncompleteForDomain:(MBXOfflineDataDomain)domain
                     metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata
                         pack:(nonnull MBXOfflineDataPack *)pack;
- (void)onVerifyingForDomain:(MBXOfflineDataDomain)domain
                    metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata
                        pack:(nonnull MBXOfflineDataPack *)pack;
- (void)onAvailableForDomain:(MBXOfflineDataDomain)domain
                    metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata
                        pack:(nonnull MBXOfflineDataPack *)pack;
- (void)onExpiredForDomain:(MBXOfflineDataDomain)domain
                  metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata
                      pack:(nonnull MBXOfflineDataPack *)pack;
- (void)onErroredForDomain:(MBXOfflineDataDomain)domain
                  metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata
                      pack:(nonnull MBXOfflineDataPack *)pack;
- (void)onDeletingForDomain:(MBXOfflineDataDomain)domain
                   metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata
                       pack:(nonnull MBXOfflineDataPack *)pack
                   callback:(nonnull MBXOfflineDataPackAcknowledgeCallback)callback;
- (void)onDeletedForDomain:(MBXOfflineDataDomain)domain
                  metadata:(nonnull MBXOfflineDataRegionMetadata *)metadata;
/** Called once all offline regions that have been downloaded to disk are initialized */
- (void)onInitialized;
/** Called when there are no operations are in progress anymore */
- (void)onIdle;
/** Called with log messages. They are informative and can be disregarded */
- (void)onLogMessageForMessage:(nonnull NSString *)message;

@property (nonatomic, nullable, readwrite) MBXPeerWrapper *peer;
@end
