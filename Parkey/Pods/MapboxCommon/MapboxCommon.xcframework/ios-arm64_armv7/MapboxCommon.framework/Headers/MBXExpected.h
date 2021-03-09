#import <Foundation/Foundation.h>

__attribute__((visibility ("default")))
@interface MBXExpected<__covariant ValueType, __covariant ErrorType>: NSObject

- (instancetype _Nonnull)initWithValue:(_Nonnull ValueType)value;
- (instancetype _Nonnull)initWithError:(_Nonnull ErrorType)error;
- (BOOL)isValue;
- (BOOL)isError;

@property (nonatomic, strong, readonly, nullable) ValueType value;
@property (nonatomic, strong, readonly, nullable) ErrorType error;

@end
