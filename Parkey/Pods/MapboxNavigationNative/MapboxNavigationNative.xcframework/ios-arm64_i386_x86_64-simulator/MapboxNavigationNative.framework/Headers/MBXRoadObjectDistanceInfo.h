// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(RoadObjectDistanceInfo)
__attribute__((visibility ("default")))
@interface MBXRoadObjectDistanceInfo : NSObject

- (nonnull instancetype)initWithDistanceToEntry:(double)distanceToEntry
                                  distanceToEnd:(double)distanceToEnd
                                 entryFromStart:(BOOL)entryFromStart
                                         length:(nullable NSNumber *)length;

/** distance along the road graph from current position to entry point of object in meters, if already "within" object will be equal to zero */
@property (nonatomic, readonly) double distanceToEntry;

/** distance along the road graph from current position to end of road object */
@property (nonatomic, readonly) double distanceToEnd;

/** if we enter road object from it's start, if already "within" object - always false */
@property (nonatomic, readonly, getter=isEntryFromStart) BOOL entryFromStart;

/** length of "long" objects */
@property (nonatomic, readonly, nullable) NSNumber *length;


@end
