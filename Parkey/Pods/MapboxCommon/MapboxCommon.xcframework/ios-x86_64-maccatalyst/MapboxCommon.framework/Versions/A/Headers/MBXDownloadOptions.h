// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXHttpRequest;

/** @brief Structure to configure download session. */
NS_SWIFT_NAME(DownloadOptions)
__attribute__((visibility ("default")))
@interface MBXDownloadOptions : NSObject

- (nonnull instancetype)initWithRequest:(nonnull MBXHttpRequest *)request
                              localPath:(nonnull NSString *)localPath;

- (nonnull instancetype)initWithRequest:(nonnull MBXHttpRequest *)request
                              localPath:(nonnull NSString *)localPath
                                 resume:(BOOL)resume;

/**
 * Structure which contains parameters to use for sending HTTP request.
 * Http method will be ignored from this request.
 */
@property (nonatomic, readwrite, nonnull) MBXHttpRequest *request;

/**
 * Absolute path where to store downloaded file.
 * If the file with that filename already exists then it will be overwrited (if resume is not specified) with downloaded file.
 */
@property (nonatomic, readonly, nonnull, copy) NSString *localPath;

/** If there is a file with localPath name already available on the disk, resume download from the offset equal to file size. */
@property (nonatomic, readwrite, getter=isResume) BOOL resume;


@end
