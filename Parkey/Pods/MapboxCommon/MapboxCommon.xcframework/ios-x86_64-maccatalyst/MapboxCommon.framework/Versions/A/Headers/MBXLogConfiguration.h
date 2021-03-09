// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXLoggingLevel.h"

@class MBXLogConfiguration;
@protocol MBXLogWriterBackend;

/**
 * @brief Instance that handles the log configuration per app.
 *
 * Use this singleton to change the LogWriterBackend to write to a different output, or set a filter.
 */
NS_SWIFT_NAME(LogConfiguration)
__attribute__((visibility ("default")))
@interface MBXLogConfiguration : NSObject

/** @brief Default constructor. */
- (nonnull instancetype)init;

/**
 * @brief Sets the backend which writes the log.
 *
 * @param logWriter Backend which writes logs
 */
- (void)registerLogWriterBackendForLogWriter:(nonnull id<MBXLogWriterBackend>)logWriter;
/**
 * @brief Returns the currently set log writer backend.
 *
 * @return the currently active LogWriter backend.
 */
- (nonnull id<MBXLogWriterBackend>)getLogWriterBackend __attribute((ns_returns_retained));
/**
 * @brief A filter level allows all messages with equal or higher level to pass. Supressed otherwise.
 *
 * @param level Logging level threshold.
 */
- (void)setFilterLevelForLevel:(MBXLoggingLevel)level;
/**
 * @brief Tells the current logging level filter.
 *
 * @return logging level
 */
- (MBXLoggingLevel)getFilterLevel;
/** @brief Provides the log configuration singleton instance. */
+ (nonnull MBXLogConfiguration *)getInstance __attribute((ns_returns_retained));

@end
