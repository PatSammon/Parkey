// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
@class MBXExpected;

NS_SWIFT_NAME(ValueConverter)
__attribute__((visibility ("default")))
@interface MBXValueConverter : NSObject

+ (nonnull MBXExpected *)fromJsonForJson:(nonnull NSString *)json __attribute((ns_returns_retained));
+ (nonnull NSString *)toJsonForValue:(nonnull id)value __attribute((ns_returns_retained));

@end
