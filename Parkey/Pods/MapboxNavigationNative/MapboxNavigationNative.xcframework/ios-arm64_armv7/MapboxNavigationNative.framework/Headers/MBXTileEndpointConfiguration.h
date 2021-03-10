// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@protocol MBXSkuTokenSource;

NS_SWIFT_NAME(TileEndpointConfiguration)
__attribute__((visibility ("default")))
@interface MBXTileEndpointConfiguration : NSObject

- (nonnull instancetype)initWithHost:(nonnull NSString *)host
                             version:(nonnull NSString *)version
                               token:(nonnull NSString *)token
                           userAgent:(nonnull NSString *)userAgent
                    navigatorVersion:(nonnull NSString *)navigatorVersion
                      skuTokenSource:(nonnull id<MBXSkuTokenSource>)skuTokenSource;

/**
 * API routing tiles (ART) endpoint address (e.g. https://api.mapbox.com)
 * Could be one of the staging servers or api.mapbox.com (primarily for OSM now)
 * Various servers may have the info from different data providers.
 */
@property (nonatomic, readonly, nonnull, copy) NSString *host;

/**
 * Version of the routing tiles on ART.
 * Usually it's a string associated with a date (e.g. 2020_07_03-03_00_00).
 * Available versions can be queried via ${host}/route-tiles/v1/versions?access_token=YOUR_TOKEN_HERE
 */
@property (nonatomic, readonly, nonnull, copy) NSString *version;

/** Mapbox access token that will be used for ART (and potentially other web services) access */
@property (nonatomic, readonly, nonnull, copy) NSString *token;

/**
 * Application's portion of the user agent string used for querying web services.
 * No specific format enforced, but it's better to have an SDK and possibly an app name/version here.
 * Will be appended to the internal portion of the user agent string via a whitespace.
 * "<internal part filled by NavNative> ${userAgent}"
 */
@property (nonatomic, readonly, nonnull, copy) NSString *userAgent;

/** Detailed Navigation SDK version. Purely for information purposes. Can be empty */
@property (nonatomic, readonly, nonnull, copy) NSString *navigatorVersion;

/** Object for querying SKU token (for billing) while constructing requests to Mapbox services */
@property (nonatomic, readonly, nonnull) id<MBXSkuTokenSource> skuTokenSource;


@end
