// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(RouterError)
__attribute__((visibility ("default")))
@interface MBXRouterError : NSObject

- (nonnull instancetype)initWithError:(nonnull NSString *)error
                                 code:(uint32_t)code;

/** Valhalla error message */
@property (nonatomic, readonly, nonnull, copy) NSString *error;

/** Valhalla error code */
@property (nonatomic, readonly) uint32_t code;


@end
