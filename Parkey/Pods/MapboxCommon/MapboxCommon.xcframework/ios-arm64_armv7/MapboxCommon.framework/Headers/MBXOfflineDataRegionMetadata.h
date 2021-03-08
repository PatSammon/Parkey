// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
@class MBXGeometry;

@class MBXOfflineDataPackMetadata;

/**
 * A metadata record for an offline region.
 *
 * The key for looking up offline regions should be a compound of id and revision.
 */
NS_SWIFT_NAME(OfflineDataRegionMetadata)
__attribute__((visibility ("default")))
@interface MBXOfflineDataRegionMetadata : NSObject

- (nonnull instancetype)initWithId:(nonnull NSString *)id
                          revision:(uint32_t)revision
                              name:(nonnull NSString *)name
                       description:(nonnull NSString *)description
                      last_updated:(nonnull NSDate *)last_updated
                         geography:(nonnull MBXGeometry *)geography
                           mapPack:(nullable MBXOfflineDataPackMetadata *)mapPack
                    navigationPack:(nullable MBXOfflineDataPackMetadata *)navigationPack;

/** A machine-readable identifier */
@property (nonatomic, readonly, nonnull, copy) NSString *id;

/** A numeric revision ID */
@property (nonatomic, readonly) uint32_t revision;

/** A human readable name */
@property (nonatomic, readonly, nonnull, copy) NSString *name;

/** A human readable description */
@property (nonatomic, readonly, nonnull, copy) NSString *description;

/** When this region was last updated */
@property (nonatomic, readonly, nonnull) NSDate *last_updated;

/** A GeoJSON geometry definition describing the extent of this region */
@property (nonatomic, readonly, nonnull) MBXGeometry *geography;

/** Metadata for map offline packs */
@property (nonatomic, readonly, nullable) MBXOfflineDataPackMetadata *mapPack;

/** Metadata for navigation offline packs */
@property (nonatomic, readonly, nullable) MBXOfflineDataPackMetadata *navigationPack;


@end
