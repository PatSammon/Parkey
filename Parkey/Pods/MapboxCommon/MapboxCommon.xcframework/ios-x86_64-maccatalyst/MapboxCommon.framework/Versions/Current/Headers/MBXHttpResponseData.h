// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/** Record which contains data received in HTTP response. */
NS_SWIFT_NAME(HttpResponseData)
__attribute__((visibility ("default")))
@interface MBXHttpResponseData : NSObject

- (nonnull instancetype)initWithHeaders:(nonnull NSDictionary<NSString *, NSString *> *)headers
                                   code:(int64_t)code
                                   data:(nonnull NSData *)data;

/** Map which contains HTTP response headers in a format header name:value. All the header names are in lower case format. */
@property (nonatomic, readonly, nonnull, copy) NSDictionary<NSString *, NSString *> *headers;

/** HTTP response code. */
@property (nonatomic, readonly) int64_t code;

/** Data chunk received in HTTP response. */
@property (nonatomic, readonly, nonnull) NSData *data;


@end
