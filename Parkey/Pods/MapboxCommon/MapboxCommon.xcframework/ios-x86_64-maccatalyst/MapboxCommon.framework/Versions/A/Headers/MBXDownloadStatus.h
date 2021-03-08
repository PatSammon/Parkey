// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXDownloadState.h"
@class MBXExpected;

@class MBXDownloadError;
@class MBXDownloadOptions;
@class MBXHttpRequestError;
@class MBXHttpResponseData;

/** @brief Structure to hold current status information about ongoing download session. */
NS_SWIFT_NAME(DownloadStatus)
__attribute__((visibility ("default")))
@interface MBXDownloadStatus : NSObject

- (nonnull instancetype)initWithError:(nullable MBXDownloadError *)error
                           totalBytes:(nullable NSNumber *)totalBytes
                      downloadOptions:(nonnull MBXDownloadOptions *)downloadOptions
                           httpResult:(nullable MBXExpected *)httpResult;

- (nonnull instancetype)initWithDownloadId:(uint64_t)downloadId
                                     state:(MBXDownloadState)state
                                     error:(nullable MBXDownloadError *)error
                                totalBytes:(nullable NSNumber *)totalBytes
                             receivedBytes:(uint64_t)receivedBytes
                           downloadOptions:(nonnull MBXDownloadOptions *)downloadOptions
                                httpResult:(nullable MBXExpected *)httpResult;

/** Download id which was created by download request. */
@property (nonatomic, readwrite) uint64_t downloadId;

/** State of download request. */
@property (nonatomic, readwrite) MBXDownloadState state;

/** The optional which contains error information in case of failure when state is set to DownloadState::Failed. */
@property (nonatomic, readwrite, nullable) MBXDownloadError *error;

/** Total amount of bytes to receive. In some cases this value is unknown until we get final part of the file. */
@property (nonatomic, readwrite, nullable) NSNumber *totalBytes;

/** Amount of bytes already received and saved on the disk. */
@property (nonatomic, readwrite) uint64_t receivedBytes;

/** Download options used to send the download request. */
@property (nonatomic, readwrite, nonnull) MBXDownloadOptions *downloadOptions;

/**
 * HTTP result. This field is only set for DownloadState::Failed and DownloadState::Finished.
 * For DownloadState::Failed expect HttpRequestError to be provided for cases when DownloadErrorCode is
 * NetworkError.
 * And for DownloadState::Finished HttpResponseData is set, but with empty data field (since all the data was written to the disk).
 */
@property (nonatomic, readwrite, nullable) MBXExpected *httpResult;


@end
