// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXDownloadErrorCode.h"

/** @brief Structure to hold error information about download request. */
NS_SWIFT_NAME(DownloadError)
__attribute__((visibility ("default")))
@interface MBXDownloadError : NSObject

- (nonnull instancetype)initWithCode:(MBXDownloadErrorCode)code
                             message:(nonnull NSString *)message;

/** Download error code. */
@property (nonatomic, readonly) MBXDownloadErrorCode code;

/** Human readable string describing an error. */
@property (nonatomic, readonly, nonnull, copy) NSString *message;


@end
