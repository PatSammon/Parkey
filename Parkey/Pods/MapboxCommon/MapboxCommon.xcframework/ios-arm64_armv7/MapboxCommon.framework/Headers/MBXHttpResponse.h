// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
@class MBXExpected;

@class MBXHttpRequest;
@class MBXHttpRequestError;
@class MBXHttpResponseData;

/** @brief Record which is used to report HTTP response to the caller. */
NS_SWIFT_NAME(HttpResponse)
__attribute__((visibility ("default")))
@interface MBXHttpResponse : NSObject

- (nonnull instancetype)initWithRequest:(nonnull MBXHttpRequest *)request
                                 result:(nonnull MBXExpected *)result;

/** HTTP request data which was use to send HTTP request. */
@property (nonatomic, readonly, nonnull) MBXHttpRequest *request;

/** Result of HTTP request call. */
@property (nonatomic, readonly, nonnull) MBXExpected *result;


@end
