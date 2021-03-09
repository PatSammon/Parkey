// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@protocol MBXHttpServiceInterface;

/**
 * @brief HTTP service factory.
 *
 * This class is used to get a pointer/reference to HTTP service platform implementation.
 * In order to set a custom implementation, the client must call `setUserDefined()` method once before any actual HTTP service is required.
 */
NS_SWIFT_NAME(HttpServiceFactory)
__attribute__((visibility ("default")))
@interface MBXHttpServiceFactory : NSObject

/** This method allows to set user defined HTTP service. */
+ (void)setUserDefinedForCustom:(nonnull id<MBXHttpServiceInterface>)custom;
/** Return pointer/reference to HTTP service or null if the service was not set yet. */
+ (nullable id<MBXHttpServiceInterface>)getInstance __attribute((ns_returns_retained));

@end
