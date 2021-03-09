#pragma once

#import "MBXLogWriterBackend.h"

NS_SWIFT_NAME(NsLogBackend)
__attribute__((visibility ("default")))
@interface MBXNsLogBackend: NSObject<MBXLogWriterBackend>
- (void)writeLogForLevel:(MBXLoggingLevel)level message:(nonnull NSString *)message category:(nullable NSString *)category;
@end
