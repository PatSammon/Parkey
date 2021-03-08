// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXGraphPosition;

NS_SWIFT_NAME(MapMatch)
__attribute__((visibility ("default")))
@interface MBXMapMatch : NSObject

- (nonnull instancetype)initWithPosition:(nonnull MBXGraphPosition *)position
                                   proba:(float)proba;

@property (nonatomic, readonly, nonnull) MBXGraphPosition *position;
/** probability of user is actually on this position */
@property (nonatomic, readonly) float proba;


@end
