// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(RouterResult)
__attribute__((visibility ("default")))
@interface MBXRouterResult : NSObject

- (nonnull instancetype)initWithJson:(nonnull NSString *)json
                             success:(BOOL)success;

@property (nonatomic, readonly, nonnull, copy) NSString *json;
@property (nonatomic, readonly, getter=isSuccess) BOOL success;

@end
