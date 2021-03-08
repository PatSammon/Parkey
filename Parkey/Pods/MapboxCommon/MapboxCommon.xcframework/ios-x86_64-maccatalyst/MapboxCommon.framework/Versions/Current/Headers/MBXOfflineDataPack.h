// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXOfflineDataPackStatus.h"

@class MBXOfflineDataError;

/** A record describing the current status of an offline pack that is being downloaded. */
NS_SWIFT_NAME(OfflineDataPack)
__attribute__((visibility ("default")))
@interface MBXOfflineDataPack : NSObject

- (nonnull instancetype)initWithStatus:(MBXOfflineDataPackStatus)status
                                 error:(nullable MBXOfflineDataError *)error
                                  path:(nonnull NSString *)path
                                 bytes:(uint64_t)bytes;

@property (nonatomic, readonly) MBXOfflineDataPackStatus status;
/** Error description for status=Errored */
@property (nonatomic, readonly, nullable) MBXOfflineDataError *error;

/** The file path on disk this offline pack is being downloaded to */
@property (nonatomic, readonly, nonnull, copy) NSString *path;

/** The number of bytes that have been downloaded to disk */
@property (nonatomic, readonly) uint64_t bytes;


@end
