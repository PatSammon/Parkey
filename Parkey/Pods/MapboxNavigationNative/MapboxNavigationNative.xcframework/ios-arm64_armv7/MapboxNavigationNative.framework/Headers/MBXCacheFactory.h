// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXCacheHandle;
@class MBXConfigHandle;
@class MBXHistoryRecorderHandle;
@class MBXRunLoopExecutorHandle;
@class MBXTilesConfig;

NS_SWIFT_NAME(CacheFactory)
__attribute__((visibility ("default")))
@interface MBXCacheFactory : NSObject

/**
 * Builds which can be re-used in various instances
 * @param tilesConfig   Configuration for tiles host, version, cache folder etc.
 * @param config        Config created with `ConfigFactory`
 * @param runLoopExecutor       Run loop created with `RunLoopExecutorFactory`
 * @param historyRecorder       History recorder created with `HistoryRecorderFactory`
 */
+ (nonnull MBXCacheHandle *)buildForTilesConfig:(nonnull MBXTilesConfig *)tilesConfig
                                         config:(nonnull MBXConfigHandle *)config
                                        runLoop:(nonnull MBXRunLoopExecutorHandle *)runLoop
                                historyRecorder:(nonnull MBXHistoryRecorderHandle *)historyRecorder __attribute((ns_returns_retained));

@end
