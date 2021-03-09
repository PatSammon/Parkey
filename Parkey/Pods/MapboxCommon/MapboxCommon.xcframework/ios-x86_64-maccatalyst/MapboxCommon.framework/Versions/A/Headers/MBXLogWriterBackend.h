// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXLoggingLevel.h"

@class MBXPeerWrapper;

NS_SWIFT_NAME(LogWriterBackend)
@protocol MBXLogWriterBackend
/**
 * @brief Writes a log message with a given level.
 *
 * @param level Severity of the message.
 * @param message Log message
 * @param category to organize log messages.
 */
- (void)writeLogForLevel:(MBXLoggingLevel)level
                 message:(nonnull NSString *)message
                category:(nullable NSString *)category;

@property (nonatomic, nullable, readwrite) MBXPeerWrapper *peer;
@end
