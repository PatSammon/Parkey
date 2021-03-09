// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBXHistoryRecorderHandle;

NS_SWIFT_NAME(HistoryRecorderHandle)
__attribute__((visibility ("default")))
@interface MBXHistoryRecorderHandle : NSObject

/** Builds history recorder which can re-used in other instances */
+ (nonnull MBXHistoryRecorderHandle *)build __attribute((ns_returns_retained));
- (void)enableForEnabled:(BOOL)enabled;
- (BOOL)isEnabled;
- (nonnull NSData *)getHistory __attribute((ns_returns_retained));
/**
 * Adds a custom event to the navigators history. This can be useful to log things that
 * happen during navigation that are specific to your application.
 * @param  eventType  the event type in the events log for your custom even
 * @param  eventJson  the json to attach to the "properties" key of the event
 */
- (void)pushHistoryForEventType:(nonnull NSString *)eventType
                      eventJson:(nonnull NSString *)eventJson;

@end
