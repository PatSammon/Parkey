#import <Foundation/Foundation.h>

// NOLINTNEXTLINE(modernize-use-using)
typedef enum {
    MBXGeometryType_Empty,
    MBXGeometryType_Point,
    MBXGeometryType_Line,
    MBXGeometryType_Polygon,
    MBXGeometryType_MultiPoint,
    MBXGeometryType_MultiLine,
    MBXGeometryType_MultiPolygon,
    MBXGeometryType_GeometryCollection
} MBXGeometryType;

__attribute__((visibility ("default")))
@interface MBXGeometry: NSObject

@property (readonly, assign) MBXGeometryType geometryType;
@property (readonly, assign, nonnull) void *geometry;

- (instancetype _Nonnull )initWithPoint:(NSValue* _Nonnull )location;
- (instancetype _Nonnull )initWithLine:(NSArray<NSValue*>* _Nonnull )locations;
- (instancetype _Nonnull )initWithPolygon:(NSArray<NSArray<NSValue*> *> *_Nonnull)locations;
- (instancetype _Nonnull )initWithMultiPoint:(NSArray<NSValue*>* _Nonnull )locations;
- (instancetype _Nonnull )initWithMultiLine:(NSArray<NSArray<NSValue*> *> *_Nonnull)locations;
- (instancetype _Nonnull )initWithMultiPolygon:(NSArray<NSArray<NSArray<NSValue*> *> *> * _Nonnull )locations;
- (instancetype _Nonnull )initWithGeometryCollection:(NSArray<MBXGeometry*> *_Nonnull)geometries;

-(nullable NSValue* )extractLocations;
-(nullable NSArray<NSValue*>* )extractLocationsArray;
-(nullable NSArray<NSArray<NSValue*> *> *)extractLocations2DArray;
-(nullable NSArray<NSArray<NSArray<NSValue*> *> *> *)extractLocations3DArray;
-(nullable NSArray<MBXGeometry*> *)extractGeometriesArray;

@end
