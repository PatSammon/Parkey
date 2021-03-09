// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXMapMatch;

NS_SWIFT_NAME(MapMatcherOutput)
__attribute__((visibility ("default")))
@interface MBXMapMatcherOutput : NSObject

- (nonnull instancetype)initWithMatches:(nonnull NSArray<MBXMapMatch *> *)matches
                             isTeleport:(BOOL)isTeleport;

/**
 * Probable user positions on the road graph sorted from the most probable to the least probable.
 * If map matcher failed or was not configured will be empty.
 */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBXMapMatch *> *matches;

/**
 * Returns true if map matcher changed its opinion about most probable path on last update.
 * In practice it means we don't need to animate puck movement from previous to current location
 * and just do "teleport".
 */
@property (nonatomic, readonly, getter=isIsTeleport) BOOL isTeleport;


@end
