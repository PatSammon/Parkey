// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXTileEndpointConfiguration;

NS_SWIFT_NAME(TilesConfig)
__attribute__((visibility ("default")))
@interface MBXTilesConfig : NSObject

- (nonnull instancetype)initWithTilesPath:(nonnull NSString *)tilesPath
                        inMemoryTileCache:(nullable NSNumber *)inMemoryTileCache
                  mapMatchingSpatialCache:(nullable NSNumber *)mapMatchingSpatialCache
                             threadsCount:(nullable NSNumber *)threadsCount
                           endpointConfig:(nullable MBXTileEndpointConfiguration *)endpointConfig;

/** Local directory with routing tiles for a cache. If empty, no tiles on disk will be read/written */
@property (nonatomic, readonly, nonnull, copy) NSString *tilesPath;

/** Advisory size of the peak memory use by routing tiles */
@property (nonatomic, readonly, nullable) NSNumber *inMemoryTileCache;

/** Obsolete; Not in use */
@property (nonatomic, readonly, nullable) NSNumber *mapMatchingSpatialCache;

/** Was used with curler implementation in Valhalla. Not in use */
@property (nonatomic, readonly, nullable) NSNumber *threadsCount;

/** API routing tiles configuration. If not set, no network requests will be made to ART */
@property (nonatomic, readonly, nullable) MBXTileEndpointConfiguration *endpointConfig;


@end
