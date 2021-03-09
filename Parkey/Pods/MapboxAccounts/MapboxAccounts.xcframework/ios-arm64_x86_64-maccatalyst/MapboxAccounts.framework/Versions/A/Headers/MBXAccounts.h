#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString *MBXAccountsSKUID NS_TYPED_ENUM;
FOUNDATION_EXTERN const MBXAccountsSKUID MBXAccountsSKUIDMapsUser;
FOUNDATION_EXTERN const MBXAccountsSKUID MBXAccountsSKUIDNavigationUser;
FOUNDATION_EXTERN const MBXAccountsSKUID MBXAccountsSKUIDNavigationSession;
FOUNDATION_EXTERN const MBXAccountsSKUID MBXAccountsSKUIDVisionUser;
FOUNDATION_EXTERN const MBXAccountsSKUID MBXAccountsSKUIDVisionFleetUser;


@interface MBXAccounts : NSObject

/**
 Activates a specific SKU identifier.

 Defaults to `MBXAccountsSKUIDMapsUser`.

 See https://www.mapbox.com/pricing/ for more information
 */
+ (void)activateSKUID:(MBXAccountsSKUID)skuId;

/**
 @param skuId is a specific SKU identifier.
 
 See https://www.mapbox.com/pricing/ for more information
 */
- (instancetype)initWithSKUID:(MBXAccountsSKUID)skuId;

/**
 Resets the current session. Calling this method has no effect unless the type
 of the SKU id is of kind session.
 */
+ (void)resetSession;

/**
 Resets cached data.
 */
- (void)reset;

/**
 Returns the current SKU token. `+[MBXAccounts activateSKUID:]` must be called
 before accessing this property unless an `MBXAccountsSKUIDMapsUser` token is preferred.
 */
@property (class, nonatomic, readonly) NSString *skuToken;

/**
 Returns the current SKU token to be used by services, such as directions and voice clients.
 */
@property (class, nonatomic, readonly) NSString *serviceSkuToken;

/**
 Returns SKU token for instance of MBXAccounts.
 */
@property (nonatomic, readonly) NSString *skuToken;

@end

NS_ASSUME_NONNULL_END
