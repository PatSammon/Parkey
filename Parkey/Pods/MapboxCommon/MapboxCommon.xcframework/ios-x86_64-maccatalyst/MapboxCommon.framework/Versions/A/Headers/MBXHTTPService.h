#pragma once

#import "MapboxHttp.h"

FOUNDATION_EXTERN NSString * _Nonnull const MBXHTTPBackgroundIdentifier;

@protocol MBXHTTPServiceDelegate <NSObject>
// Normally used as a global progress indicator for when the app has been suspended and a download continued in the background
// and completion handlers has been lost.
- (void)httpService:(id<MBXHttpServiceInterface> _Nonnull)service didUpdateDownloadStatus:(MBXDownloadStatus *_Nonnull)downloadStatus;
@end

__attribute__((visibility ("default")))
@interface MBXHTTPService : NSObject<MBXHttpServiceInterface>

@property (nonatomic, weak, nullable) id<MBXHTTPServiceDelegate> delegate;

- (instancetype _Nonnull )init NS_UNAVAILABLE;
+ (instancetype _Nonnull )defaultService;

- (void)setMaxRequestsPerHostForMax:(uint8_t)max;
- (BOOL)supportsKeepCompression;
- (uint64_t)requestForRequest:(MBXHttpRequest * _Nonnull)request callback:(MBXHttpResponseCallback _Nonnull )callback;
- (void)cancelRequestForId:(uint64_t)id callback:(MBXResultCallback _Nonnull )callback;
- (uint64_t)downloadForOptions:(MBXDownloadOptions * _Nonnull)options
                      callback:(MBXDownloadStatusCallback _Nonnull)callback;

- (void)handleEventsForBackgroundURLSessionWithIdentifier:(NSString *_Nonnull)identifier completionHandler:(void(^_Nonnull)(void))completionHandler;

@end

