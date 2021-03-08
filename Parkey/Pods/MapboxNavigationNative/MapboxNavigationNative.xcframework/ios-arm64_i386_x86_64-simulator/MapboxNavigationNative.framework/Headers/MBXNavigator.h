// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXActiveGuidanceGeometryEncoding.h"
#import <CoreLocation/CoreLocation.h>
@class MBXExpected;

@class MBXActiveGuidanceOptions;
@class MBXBannerInstruction;
@class MBXCacheHandle;
@class MBXConfigHandle;
@class MBXFixLocation;
@class MBXHistoryRecorderHandle;
@class MBXLocation;
@class MBXNavigationStatus;
@class MBXNavigatorConfig;
@class MBXRouteInfo;
@class MBXRouterResult;
@class MBXRunLoopExecutorHandle;
@class MBXSensorData;
@class MBXSettingsProfile;
@class MBXTilesConfig;
@class MBXVoiceInstruction;
@class MBXWaypoint;
@protocol MBXElectronicHorizonObserver;
@protocol MBXLocationObserver;
@protocol MBXNavigatorObserver;

NS_SWIFT_NAME(Navigator)
__attribute__((visibility ("default")))
@interface MBXNavigator : NSObject

/**
 * DEPRECATED: use another constructor with dependency injection.
 * Constructs navigator object with chosen configuration
 *
 * @param profile       Indication for a settings profile for default
 * @param config        Config with well-established parameters suitable for most of the users
 * @param customConfig  JSON with parameters that may override some defaults from a profile
 * @param tilesConfig   Configuration for tiles host, version, cache folder etc.
 */
- (nonnull instancetype)initWithProfile:(nonnull MBXSettingsProfile *)profile
                                 config:(nonnull MBXNavigatorConfig *)config
                           customConfig:(nonnull NSString *)customConfig
                            tilesConfig:(nonnull MBXTilesConfig *)tilesConfig;

/**
 * Constructs navigator object with given dependencies
 *
 * @param config           config created with `ConfigFactory`
 * @param runLoopExecutor  run loop executor created with `RunLoopExecutorFactory`
 * @param cache            cache created with `CacheFactory`
 * @param historyRecorder  history recorder created with `HistoryRecorderFactory`
 */
- (nonnull instancetype)initWithConfig:(nonnull MBXConfigHandle *)config
                       runLoopExecutor:(nonnull MBXRunLoopExecutorHandle *)runLoopExecutor
                                 cache:(nonnull MBXCacheHandle *)cache
                       historyRecorder:(nonnull MBXHistoryRecorderHandle *)historyRecorder;

/**
 * After setting observer `getStatus` shouldn't be called,
 * but `Navigator` object will start calling `NavigatorObserver.onStatus` as soon as at least one raw location is received.
 * In order to remove observer just call `setObserver(null)`.
 */
- (void)setObserverForObserver:(nullable id<MBXNavigatorObserver>)observer;
/**
 * Sets or resets the route path for the navigator to process.
 * @param  routeResponse  An optional string containing a json/pbf route response. To reset routes, pass nullopt, "{}" or empty string.
 * @param  route    Current route index in routes object, sets which route to follow
 * @param  leg      Current route leg, sets leg to follow
 * @param  options  Additional options related to this route
 * @return filled `RouteInfo` on success, error string on failure. In case of unsetting route, returns RouteInfo with empty alerts.
 */
- (nonnull MBXExpected *)setRouteForRouteResponse:(nullable NSString *)routeResponse
                                            route:(uint32_t)route
                                              leg:(uint32_t)leg
                                          options:(nonnull MBXActiveGuidanceOptions *)options __attribute((ns_returns_retained));
/**
 * @return all remaining waypoints on the current route. If waypoints were not passed with setRoute,
 * or there is no active route returns empty array
 */
- (nonnull NSArray<MBXWaypoint *> *)remainingWaypoints __attribute((ns_returns_retained));
/** Caches tiles around last set route */
- (void)cacheLastRoute;
/**
 * Downloads tiles of all levels that intersect the rectangular region
 * and stores them to disk. The area is described by the bounding box.
 * After the tiles are downloaded, it should be possible to do
 * off-line routing in the pre-fetched region.
 *
 * @param  lowerLeft    south-west corner of bounding box (long, lat)
 * @param  upperRight   north-east corner of bounding box (long, lat)
 */
- (void)prefetchBoundingBoxForLowerLeft:(CLLocationCoordinate2D)lowerLeft
                             upperRight:(CLLocationCoordinate2D)upperRight;
/**
 * Updates annotations so that subsequent calls to getStatus will
 * reflect the most current annotations for the route
 *
 * @param  annotations  A string containing the json/pbf annotations
 * @param  route  Which route to apply the annotation update to
 * @param  leg    Which leg to apply the annotation update to
 *
 * @return  True if the annotations could be updated false if not (wrong number of annotations)
 */
- (BOOL)updateAnnotationsForRouteResponse:(nonnull NSString *)routeResponse
                                    route:(uint32_t)route
                                      leg:(uint32_t)leg;
/**
 * Passes in the current fix location of the user.
 *
 * @param  fix  The current fix location of user.
 *
 * @return true if the fix location was usable false if not
 */
- (BOOL)updateLocationForFixLocation:(nonnull MBXFixLocation *)fixLocation;
/**
 * Passes in the current sensor data of the user.
 *
 * @param  data  The current sensor data of user.
 *
 * @return true if the sensor data was usable false if not
 */
- (BOOL)updateSensorDataForSensorData:(nonnull MBXSensorData *)sensorData;
/**
 * DEPRECATED - use `NavigatorObserver` instead(but shouldn't be used together in parallel).
 * Gets the status as an offset in time from the last fix location provided. This
 * allows the caller to get hallucinated statuses in the future along the route if
 * for some reason (poor reception) they aren't able to get fix locations into the
 * Navigator.
 *
 * This method will use previous fixes to find snap the users location to the route
 * and verify that the user is still on the route. Also, this method will determine
 * if an instruction needs to be called out for the user.
 *
 *
 * @param   monotonic(i.e. each new value is greater than previous one) timestamp
 *          point in time when you wish to receive the status for.
 *          If on some platform monotonic time is not provided by system then using
 *          of non-monotonic clock is allowed, but if time decreased at some point
 *          last status will be returned. The same time source must be used for
 *          this timestamp and `FixLocation::monotonicTimestamp`.
 *          Measured in nanoseconds.
 *
 * @return  the last status as a result of fix location updates.  If the timestamp
 *          is earlier than previously reported timestamp in the status, the last
 *          status will be returned, the function does not support re-winding time.
 */
- (nonnull MBXNavigationStatus *)getStatusForMonotonicTimestampNanoseconds:(int64_t)monotonicTimestampNanoseconds __attribute((ns_returns_retained));
/**
 * Returns current navigator status(actually last returned by `getStatus` or passed to `NavigatorObserver#onStatus`.
 * Guaranteed to be stateless.
 * If there was no previous `updateLocation` call returns null.
 */
- (nullable MBXNavigationStatus *)getStatus __attribute((ns_returns_retained));
/**
 * Gets the banner at a specific step index in the route. If there is no
 * banner at the specified index, we will do something.
 */
- (nullable MBXBannerInstruction *)getBannerInstructionForIndexInRoute:(uint32_t)indexInRoute __attribute((ns_returns_retained));
/**
 * Gets the voice instruction at a specific step index in the route. If there is no
 * voice instruction at the specified index, we will do something.
 */
- (nullable MBXVoiceInstruction *)getVoiceInstructionForIndexInRoute:(uint32_t)indexInRoute __attribute((ns_returns_retained));
/**
 * Gets the geometry object for the currently established route.
 * If a route has not been provided, it will return std::experimental::nullopt.
 *
 */
- (nullable NSArray<CLLocation *> *)getRouteGeometry __attribute((ns_returns_retained));
/**
 * Gets the bounding box of the geometry object for the currently established route
 * It will return a vector of points with a length of 2 where the first point holds
 * the minX and minY and the second point holds the maxX and maxY
 * If a route has not been provided, it will return std::experimental::nullopt.
 */
- (nullable NSArray<CLLocation *> *)getRouteBoundingBox __attribute((ns_returns_retained));
/**
 * Gets a polygon around the currently loaded route. The method uses a bitmap approach
 * in which you specify a grid size (pixel size) and a dilation (how many pixels) to
 * expand the initial grid cells that are intersected by the route. In this way we can
 * approximate st_buffer very efficiently even for large complex geometries
 *
 * @param grid_size           the size of the individual grid cells
 * @param dilation            the number of pixels to dilate the initial intersection by it can
 *                            be thought of as controlling the halo thickness around the route
 * @param feature_collection  whether or not to return a feature collection or just the geometry
 * @return a geojson representing the route buffer polygon
 */
- (nullable NSString *)getRouteBufferGeoJsonForGrid_size:(float)grid_size
                                                dilation:(uint16_t)dilation __attribute((ns_returns_retained));
/**
 * Gets last location predicted by Kalman filter.
 * If navigatorEKF is not initialized, it will return std::experimental::nullopt.
 */
- (nullable MBXFixLocation *)getKalmanFixLocation __attribute((ns_returns_retained));
/**
 * DEPRECATED. Use HistoryRecorder class instead.
 * Gets the history of state changing calls to the navigator this can be used to
 * replay a sequence of events for the purpose of bug fixing
 * @return  a json representing the series of events that happened since the last time
 *          history was toggled on
 */
- (nonnull NSString *)getHistory __attribute((ns_returns_retained));
/**
 * DEPRECATED. Use HistoryRecorder class instead.
 * Toggles the recording of history on or off
 * @param  onOff  set this to true to turn on history recording and false to turn it off
 *                toggling will reset all history call getHistory first before toggling
 *                to retain a copy
 */
- (void)toggleHistoryForOnOff:(BOOL)onOff;
/**
 * DEPRECATED. Use HistoryRecorder class instead.
 * Adds a custom event to the navigators history. This can be useful to log things that
 * happen during navigation that are specific to your application.
 * @param  eventType  the event type in the events log for your custom even
 * @param  eventJson  the json to attach to the "properties" key of the event
 */
- (void)pushHistoryForEventType:(nonnull NSString *)eventType
                      eventJson:(nonnull NSString *)eventJson;
/**
 * Follows a new route and leg of the already loaded directions
 * Returns a initialized route state if no errors occurred
 * otherwise, it returns a invalid route state.
 *
 * @param route  new route id
 * @param leg    new leg id
 *
 * @return `true` when the route leg has successfully changed, otherwise `false`.
 */
- (BOOL)changeRouteLegForRoute:(uint32_t)route
                           leg:(uint32_t)leg;
/**
 * Compare given route with current route.
 * Routes are considered the same if one of the routes is a suffix of another
 * without the first and last intersection.
 *
 * If we don't have an active route, return `true`.
 * If given route has less or equal 2 intersections we consider them different
 * Algorithm doesn't depend on current position just compare routes.
 *
 * @param routeResponse     the route in json format
 * @param geometryEncoding  geometry encoding of the given route
 *
 * @return `true` if routes are different, otherwise `false`.
 */
- (BOOL)isDifferentRouteForRouteResponse:(nonnull NSString *)routeResponse
                        geometryEncoding:(MBXActiveGuidanceGeometryEncoding)geometryEncoding;
/**
 * DEPRECATED. Use `Router` instead.
 * Uses libvalhalla and local tile data to generate mapbox-directions-api-like json
 *
 * @param   directionsUri  the uri used when hitting the http service
 * @return  a RouterResult object with the json and a success/fail bool
 */
- (nonnull MBXRouterResult *)getRouteForDirectionsUri:(nonnull NSString *)directionsUri __attribute((ns_returns_retained));
/**
 * DEPRECATED. Use `Router::unpackTiles` instead
 * Passes in an input path to the tar file and output path.
 *
 * @param  packedTilesPath  The path to the packed tiles.
 * @param  outputDirectory The path to the unpacked files.
 *
 * @return the number of unpacked tiles
 */
- (uint64_t)unpackTilesForPackedTilesPath:(nonnull NSString *)packedTilesPath
                          outputDirectory:(nonnull NSString *)outputDirectory;
/**
 * DEPRECATED. Use `Router::removeTiles` instead
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
- (uint64_t)removeTilesForPackedTilesPath:(nonnull NSString *)packedTilesPath
                                lowerLeft:(CLLocationCoordinate2D)lowerLeft
                               upperRight:(CLLocationCoordinate2D)upperRight;
/** Set an observer and the configuration for the EH. */
- (void)setElectronicHorizonObserverForObserver:(nullable id<MBXElectronicHorizonObserver>)observer;
/**
 * Adds road object to be tracked in electronic horizon. In case if object with such id already exists updates it.
 * @param id       unique id of object
 * @param location road object location (can be obtained using OpenLRDecoder)
 */
- (void)addRoadObjectForId:(nonnull NSString *)id
                  location:(nonnull MBXLocation *)location;
/**
 * Removes road object(i.e. stops tracking it in electronic horizon)
 * @param id of road object
 */
- (void)removeRoadObjectForId:(nonnull NSString *)id;
/** Set an observer for location related data */
- (void)setLocationObserverForObserver:(nullable id<MBXLocationObserver>)observer;
/**
 * Resets ride session. This method exposes recreation of ride session, which is
 * needed for restarting of simulation.
 * Please call it before significant change of location, e.g. when restarting
 * navigation simulation, or before resetting location to not real (simulated)
 * position without recreation of navigator.
 */
- (void)resetRideSession;

@end
