// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXBannerComponentSubType.h"

NS_SWIFT_NAME(BannerComponent)
__attribute__((visibility ("default")))
@interface MBXBannerComponent : NSObject

- (nonnull instancetype)initWithType:(nonnull NSString *)type
                                text:(nonnull NSString *)text
                                abbr:(nullable NSString *)abbr
                        abbrPriority:(nullable NSNumber *)abbrPriority
                        imageBaseurl:(nullable NSString *)imageBaseurl
                              active:(nullable NSNumber *)active
                          directions:(nullable NSArray<NSString *> *)directions
                            imageURL:(nullable NSString *)imageURL
                             subType:(nullable NSNumber *)subType;

@property (nonatomic, readonly, nonnull, copy) NSString *type;
@property (nonatomic, readonly, nonnull, copy) NSString *text;
@property (nonatomic, readonly, nullable, copy) NSString *abbr;
@property (nonatomic, readonly, nullable) NSNumber *abbrPriority;
@property (nonatomic, readonly, nullable, copy) NSString *imageBaseurl;
@property (nonatomic, readonly, nullable) NSNumber *active;
@property (nonatomic, readonly, nullable, copy) NSArray<NSString *> *directions;
/** The full url for a guidance view image */
@property (nonatomic, readonly, nullable, copy) NSString *imageURL;

/** Provides more context about the component guidance view that may help in visual markup and display choices. */
@property (nonatomic, readonly, nullable) NSNumber *subType;


@end
