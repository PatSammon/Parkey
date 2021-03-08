// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXRunLoopExecutorHandle;

NS_SWIFT_NAME(RunLoopExecutorFactory)
__attribute__((visibility ("default")))
@interface MBXRunLoopExecutorFactory : NSObject

/** Builds run loop executor which can be re-used in various instances */
+ (nonnull MBXRunLoopExecutorHandle *)build __attribute((ns_returns_retained));
/** Builds run loop executor which allows to manually control execution by `runOne` method(useful for tests) */
+ (nonnull MBXRunLoopExecutorHandle *)buildManual __attribute((ns_returns_retained));

@end
