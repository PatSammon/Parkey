// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXFRC.h"
#import <CoreLocation/CoreLocation.h>

@class MBXElectronicHorizonEdge;
@class MBXRoadNameInfo;

NS_SWIFT_NAME(ElectronicHorizonEdge)
__attribute__((visibility ("default")))
@interface MBXElectronicHorizonEdge : NSObject

- (nonnull instancetype)initWithId:(uint64_t)id
                             level:(uint8_t)level
                       probability:(double)probability
                           heading:(double)heading
                            length:(double)length
                               out:(nonnull NSArray<MBXElectronicHorizonEdge *> *)out
                               frc:(MBXFRC)frc
                             wayId:(nonnull NSString *)wayId
                        speedLimit:(nullable NSNumber *)speedLimit
                             speed:(double)speed
                              ramp:(BOOL)ramp
                          motorway:(BOOL)motorway
                            bridge:(BOOL)bridge
                            tunnel:(BOOL)tunnel
                              toll:(BOOL)toll
                             names:(nonnull NSArray<MBXRoadNameInfo *> *)names
                         laneCount:(nullable NSNumber *)laneCount
                     meanElevation:(nullable NSNumber *)meanElevation
                         curvature:(uint8_t)curvature
                       countryCode:(nullable NSString *)countryCode
                         stateCode:(nullable NSString *)stateCode
                          geometry:(nullable NSArray<CLLocation *> *)geometry
                 positiveDirection:(BOOL)positiveDirection;

/** Edge id of the road graph (internal; don't confuse with wayId) */
@property (nonatomic, readonly) uint64_t id;

/**
 * The level of the Edge (0 being the mpp, 1 branches of the mpp,
 * 2 branches of level 1 branches, etc)
 */
@property (nonatomic, readonly) uint8_t level;

/** The probability for this edge in percentage */
@property (nonatomic, readonly) double probability;

/** The bearing in degrees clockwise at the start of the edge. */
@property (nonatomic, readonly) double heading;

/** The Edge's length in meters. */
@property (nonatomic, readonly) double length;

/**
 * The outgoing Edges.
 * NB: MPP can be splitted at some point if some of edges have low probability difference(+/- 0.05),
 * i.e. `out` can contain more than 1 edges with the level 0.
 * Currently we have a limitation for maximum 1 split per electronic horizon.
 */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBXElectronicHorizonEdge *> *out;

/** The edge's functional road class */
@property (nonatomic, readonly) MBXFRC frc;

/** The edge's way IDs */
@property (nonatomic, readonly, nonnull, copy) NSString *wayId;

/** The Edge's max speed (m/s) */
@property (nonatomic, readonly, nullable) NSNumber *speedLimit;

/** The Edge's average speed (m/s) */
@property (nonatomic, readonly) double speed;

/** Is the edge a ramp? */
@property (nonatomic, readonly, getter=isRamp) BOOL ramp;

/** Is the edge a motorway? */
@property (nonatomic, readonly, getter=isMotorway) BOOL motorway;

/** Is the edge a bridge? */
@property (nonatomic, readonly, getter=isBridge) BOOL bridge;

/** Is the edge a tunnel? */
@property (nonatomic, readonly, getter=isTunnel) BOOL tunnel;

/** Is the edge a toll road? */
@property (nonatomic, readonly, getter=isToll) BOOL toll;

/** The edge's names */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBXRoadNameInfo *> *names;

/** The edge's lane counts */
@property (nonatomic, readonly, nullable) NSNumber *laneCount;

/** The edge's mean elevation */
@property (nonatomic, readonly, nullable) NSNumber *meanElevation;

/** The edge's curvature */
@property (nonatomic, readonly) uint8_t curvature;

/** The edge's country code (ISO-3 format) */
@property (nonatomic, readonly, nullable, copy) NSString *countryCode;

/** The edge's state code */
@property (nonatomic, readonly, nullable, copy) NSString *stateCode;

/** Geometry if requested. */
@property (nonatomic, readonly, nullable, copy) NSArray<CLLocation *> *geometry;

/** The direction of the edge along the way (may be needed in case of custom logic that involves the wayId and way info) */
@property (nonatomic, readonly, getter=isPositiveDirection) BOOL positiveDirection;


@end
