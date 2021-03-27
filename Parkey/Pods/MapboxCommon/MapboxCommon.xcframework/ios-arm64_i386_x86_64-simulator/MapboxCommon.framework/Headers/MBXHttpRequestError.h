// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXHttpRequestErrorType.h"

/** @brief Record which contains detailed information about HTTP error happened during request/download call. */
NS_SWIFT_NAME(HttpRequestError)
__attribute__((visibility ("default")))
@interface MBXHttpRequestError : NSObject

- (nonnull instancetype)initWithType:(MBXHttpRequestErrorType)type
                             message:(nonnull NSString *)message;

/** Error type. */
@property (nonatomic, readonly) MBXHttpRequestErrorType type;

/** Detailed description of the error. */
@property (nonatomic, readonly, nonnull, copy) NSString *message;


@end
