// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(RoadNameInfo)
__attribute__((visibility ("default")))
@interface MBXRoadNameInfo : NSObject

- (nonnull instancetype)initWithName:(nonnull NSString *)name
                            shielded:(BOOL)shielded;

@property (nonatomic, readonly, nonnull, copy) NSString *name;
@property (nonatomic, readonly, getter=isShielded) BOOL shielded;

@end
