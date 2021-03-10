// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/** A metadata record for an offline pack that belongs to an offline region. */
NS_SWIFT_NAME(OfflineDataPackMetadata)
__attribute__((visibility ("default")))
@interface MBXOfflineDataPackMetadata : NSObject

- (nonnull instancetype)initWithUrl:(nonnull NSString *)url
                       md5_checksum:(nonnull NSString *)md5_checksum
                              bytes:(uint64_t)bytes
                             format:(uint32_t)format
                       data_version:(nonnull NSString *)data_version;

/** The URL the offline pack can be downloaded from. */
@property (nonatomic, readonly, nonnull, copy) NSString *url;

/** The total number of bytes of this offline pack */
@property (nonatomic, readonly, nonnull, copy) NSString *md5_checksum;

/** The total number of bytes of this offline pack */
@property (nonatomic, readonly) uint64_t bytes;

/** A numeric version of the format. An SDK version only supports one format version and uses this field to verify compatibility. */
@property (nonatomic, readonly) uint32_t format;

/** A version identifier. Some data can only be used together with matching versions. */
@property (nonatomic, readonly, nonnull, copy) NSString *data_version;


@end
