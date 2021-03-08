// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXElectronicHorizonResultType.h"

@class MBXElectronicHorizon;
@class MBXGraphPosition;
@class MBXRoadObjectDistanceInfo;

@class MBXPeerWrapper;

NS_SWIFT_NAME(ElectronicHorizonObserver)
@protocol MBXElectronicHorizonObserver
/**
 * When called with type == ElectronicHorizonResultType::UPDATE, the onEdgesRemoved and onEdgesAdded
 * callbacks will be fired as well. If type == ElectronicHorizonResultType::INITIAL, these callbacks
 * will not be fired
 */
- (void)onElectronicHorizonUpdatedForHorizon:(nonnull MBXElectronicHorizon *)horizon
                                        type:(MBXElectronicHorizonResultType)type;
/**
 * Called after onElectronicHorizonUpdated. Might be called
 * multiple times when the position changes
 * @param position current map-matched position
 * @param distances map road object id -> RoadObjectDistanceInfo for upcoming road objects
 */
- (void)onPositionUpdatedForPosition:(nonnull MBXGraphPosition *)position
                           distances:(nonnull NSDictionary<NSString *, MBXRoadObjectDistanceInfo *> *)distances;
/**
 * Called when entry to line-like(i.e. which has length != null) road object was detected
 * @param roadObjectId
 * @param enterFromStart if object was entered via it's start
 */
- (void)onRoadObjectEnterForRoadObjectId:(nonnull NSString *)roadObjectId
                          enterFromStart:(BOOL)enterFromStart;
/**
 * Called when exit from line-like(i.e. which has length != null) road object was detected
 * @param roadObjectId
 * @param enterFromEnd if object was exited via it's end
 */
- (void)onRoadObjectExitForRoadObjectId:(nonnull NSString *)roadObjectId
                            exitFromEnd:(BOOL)exitFromEnd;

@property (nonatomic, nullable, readwrite) MBXPeerWrapper *peer;
@end
