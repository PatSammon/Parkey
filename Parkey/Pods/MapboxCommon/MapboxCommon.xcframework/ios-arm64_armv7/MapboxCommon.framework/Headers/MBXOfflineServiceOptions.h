// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/** Configuration options for accessing the Offline Data API. */
NS_SWIFT_NAME(OfflineServiceOptions)
__attribute__((visibility ("default")))
@interface MBXOfflineServiceOptions : NSObject

- (nonnull instancetype)initWithUsername:(nonnull NSString *)username
                             accessToken:(nonnull NSString *)accessToken
                                 baseURL:(nullable NSString *)baseURL;

/** The username is used when querying information from the server, and for compartmentalizing offline packs on disk. */
@property (nonatomic, readonly, nonnull, copy) NSString *username;

/** A (read-only) access token for querying information from the server. */
@property (nonatomic, readonly, nonnull, copy) NSString *accessToken;

/** Base endpoint URL. Defaults to "https://api.mapbox.com" */
@property (nonatomic, readonly, nullable, copy) NSString *baseURL;


@end
