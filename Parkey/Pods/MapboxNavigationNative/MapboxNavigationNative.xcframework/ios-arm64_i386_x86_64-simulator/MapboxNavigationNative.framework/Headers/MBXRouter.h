// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXRouterCallback.h"
#import <CoreLocation/CoreLocation.h>

@class MBXCacheHandle;

NS_SWIFT_NAME(Router)
__attribute__((visibility ("default")))
@interface MBXRouter : NSObject

/**
 * Constructs router object with given dependencies
 * @param `cache` cache created with `CacheFactory`
 */
- (nonnull instancetype)initWithCache:(nonnull MBXCacheHandle *)cache;

/**
 * Uses libvalhalla and tiles from cache to generate Directions API like json
 *
 * @param   directionsUri  the uri used when hitting the http service
 * @param   callback will be called on result, there is no guarantee on which thread it will be called
 */
- (void)getRouteForDirectionsUri:(nonnull NSString *)directionsUri
                        callback:(nonnull MBXRouterCallback)callback;
/**
 * Passes in an input path to the tar file and output path.
 *
 * @param  packedTilesPath  The path to the packed tiles.
 * @param  outputDirectory The path to the unpacked files.
 *
 * @return the number of unpacked tiles
 */
+ (uint64_t)unpackTilesForPackedTilesPath:(nonnull NSString *)packedTilesPath
                          outputDirectory:(nonnull NSString *)outputDirectory;
/**
 * Removes tiles wholly within the supplied bounding box. If the tile is not
 * contained completely within the bounding box it will remain in the cache.
 * After removing files from the cache any routers should be reconfigured
 * to synchronize their in memory cache with the disk
 *
 * @param packedTilesPath  The path to the tiles.
 * @param lowerLeft         The lower left coord of the bbox.
 * @param upperRight        The upper right coord of the bbox.
 *
 * @return the number of tiles removed
 */
+ (uint64_t)removeTilesForPackedTilesPath:(nonnull NSString *)packedTilesPath
                                lowerLeft:(CLLocationCoordinate2D)lowerLeft
                               upperRight:(CLLocationCoordinate2D)upperRight;

@end
