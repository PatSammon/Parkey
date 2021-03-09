#pragma once

#import "MBXLogWriterBackend.h"

NS_SWIFT_NAME(OsLogBackend)
__attribute__((visibility ("default")))
@interface MBXOsLogBackend: NSObject<MBXLogWriterBackend>
- (void)writeLogForLevel:(MBXLoggingLevel)level message:(nonnull NSString *)message category:(nullable NSString *)category;
@end
