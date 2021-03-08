// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXDecodeCallback.h"
#import "MBXStandard.h"

@class MBXCacheHandle;

NS_SWIFT_NAME(OpenLRDecoder)
__attribute__((visibility ("default")))
@interface MBXOpenLRDecoder : NSObject

- (nonnull instancetype)initWithCache:(nonnull MBXCacheHandle *)cache;
/**
 * Decodes given base64-encoded reference and returns result in callback.
 * In case of error(if there is no tiles in cache, decoding failed etc) returns it's description.
 */
- (void)decodeForBase64Encoded:(nonnull NSArray<NSString *> *)base64Encoded
                      standard:(MBXStandard)standard
                      callback:(nonnull MBXDecodeCallback)callback;

@end
