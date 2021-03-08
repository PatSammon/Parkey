#import <Foundation/Foundation.h>

@class MBXGeometry;

__attribute__((visibility ("default")))
@interface MBXFeature: NSObject

@property (readonly, retain, nonnull) NSObject *identifier;
@property (readonly, retain, nonnull) MBXGeometry *geometry;
@property(readonly, retain, nonnull) NSDictionary<NSString *, NSObject *> *properties;

@end
