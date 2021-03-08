// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXSKUIdentifier.h"

NS_SWIFT_NAME(TokenGenerator)
__attribute__((visibility ("default")))
@interface MBXTokenGenerator : NSObject

/**
 * @brief SKU tokens are created for a specific product and expires automatically
 * so get a new token for each request.
 * @param identifier the identifier associated with the token
 */
+ (nonnull NSString *)getSKUTokenForIdentifier:(MBXSKUIdentifier)identifier __attribute((ns_returns_retained));

@end
