// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXOfflineDataErrorCode.h"

/** Describes an error that occured while querying for offline regions, or downloading and verifying an offline pack. */
NS_SWIFT_NAME(OfflineDataError)
__attribute__((visibility ("default")))
@interface MBXOfflineDataError : NSObject

- (nonnull instancetype)initWithCode:(MBXOfflineDataErrorCode)code
                             message:(nonnull NSString *)message;

@property (nonatomic, readonly) MBXOfflineDataErrorCode code;
/** A textual description of what went wrong */
@property (nonatomic, readonly, nonnull, copy) NSString *message;


@end
