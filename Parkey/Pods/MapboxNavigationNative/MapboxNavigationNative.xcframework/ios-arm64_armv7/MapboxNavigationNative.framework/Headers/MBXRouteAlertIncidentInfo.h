// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXRouteAlertIncidentType.h"

@class MBXRouteAlertIncidentCongestionInfo;

NS_SWIFT_NAME(RouteAlertIncidentInfo)
__attribute__((visibility ("default")))
@interface MBXRouteAlertIncidentInfo : NSObject

- (nonnull instancetype)initWithId:(nonnull NSString *)id
                              type:(MBXRouteAlertIncidentType)type
                         startTime:(nullable NSDate *)startTime
                           endTime:(nullable NSDate *)endTime
                      creationTime:(nullable NSDate *)creationTime
                 iso_3166_1_alpha2:(nullable NSString *)iso_3166_1_alpha2
                      lanesBlocked:(nonnull NSArray<NSString *> *)lanesBlocked
                            closed:(BOOL)closed
                        congestion:(nullable MBXRouteAlertIncidentCongestionInfo *)congestion
                            impact:(nullable NSString *)impact
                       description:(nullable NSString *)description
                           subType:(nullable NSString *)subType
                subTypeDescription:(nullable NSString *)subTypeDescription
                       alertcCodes:(nonnull NSArray<NSNumber *> *)alertcCodes;

/** id of incident */
@property (nonatomic, readonly, nonnull, copy) NSString *id;

/** type of incident */
@property (nonatomic, readonly) MBXRouteAlertIncidentType type;

/** start time of incident */
@property (nonatomic, readonly, nullable) NSDate *startTime;

/** end time of incident */
@property (nonatomic, readonly, nullable) NSDate *endTime;

/** creation time of incident */
@property (nonatomic, readonly, nullable) NSDate *creationTime;

/** ISO-3166-1 (2-letter country name) */
@property (nonatomic, readonly, nullable, copy) NSString *iso_3166_1_alpha2;

/**
 * lanes which are blocked
 * examples (case is not guaranteed): LEFT, LEFT CENTER, LEFT TURN LANE, CENTER, RIGHT, RIGHT CENTER,
 * RIGHT TURN LANE, HOV, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, SIDE, SHOULDER, MEDIAN
 */
@property (nonatomic, readonly, nonnull, copy) NSArray<NSString *> *lanesBlocked;

/** `true` if road is closed and no possibility to pass through there */
@property (nonatomic, readonly, getter=isClosed) BOOL closed;

/** quantitative descriptor of congestion */
@property (nonatomic, readonly, nullable) MBXRouteAlertIncidentCongestionInfo *congestion;

/**
 * the rate of incident
 * examples: "unknown", "critical", "major", "minor", "low"
 */
@property (nonatomic, readonly, nullable, copy) NSString *impact;

/** human-readable description of the incident suitable for displaying to the users */
@property (nonatomic, readonly, nullable, copy) NSString *description;

/** sub-type of the incident */
@property (nonatomic, readonly, nullable, copy) NSString *subType;

/** sub-type-specific description */
@property (nonatomic, readonly, nullable, copy) NSString *subTypeDescription;

/** RDS-TMC alert-c codes of incident */
@property (nonatomic, readonly, nonnull, copy) NSArray<NSNumber *> *alertcCodes;


@end
