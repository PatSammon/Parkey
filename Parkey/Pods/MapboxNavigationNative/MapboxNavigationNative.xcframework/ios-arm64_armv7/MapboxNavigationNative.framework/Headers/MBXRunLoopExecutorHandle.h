// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(RunLoopExecutorHandle)
__attribute__((visibility ("default")))
@interface MBXRunLoopExecutorHandle : NSObject

/**
 * Executes at most one ready task in run loop, useful for tests
 * if there are no ready tasks returns immediately
 * @return `true` if some task was executed, `false` otherwise
 */
- (BOOL)pollOne;
/** Executes at most one ready task in run loop in blocking way, useful for tests */
- (void)runOne;

@end
