// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/** An error code describing why an error occurred. */
// NOLINTNEXTLINE(modernize-use-using)
typedef NS_CLOSED_ENUM(NSInteger, MBXOfflineDataErrorCode)
{
    /** Unknown error */
    MBXOfflineDataErrorCodeUnknown,
    /** The offline pack could not be found on the server */
    MBXOfflineDataErrorCodeNotFound,
    /** The download failed because the access token is invalid */
    MBXOfflineDataErrorCodeUnauthorized,
    /** The download failed permanently because the request was rate limited */
    MBXOfflineDataErrorCodeRateLimited,
    /** The download failed permanently due to a connection issue */
    MBXOfflineDataErrorCodeConnection,
    /** The download failed permanently due to a server issue */
    MBXOfflineDataErrorCodeServer,
    /** The data received from the server is invalid */
    MBXOfflineDataErrorCodeInvalidResponse,
    /** The offline pack is corrupt and can't be used */
    MBXOfflineDataErrorCodeCorrupt,
    /** The offline pack could not be downloaded because a file system error occurred */
    MBXOfflineDataErrorCodeFilesystem
} NS_SWIFT_NAME(OfflineDataErrorCode);
