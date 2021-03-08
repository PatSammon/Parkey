// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/**
 * @brief Write log messages.
 *
 * The backends shipped with the SDK Common Library are thread-safe.
 */
NS_SWIFT_NAME(Log)
__attribute__((visibility ("default")))
@interface MBXLog : NSObject

/**
 * @brief Writes a debug message. Use it to output verbose data to understand how your app executes.
 *
 * @param message The log message.
 * @param category An optional string representing a log category.
 */
+ (void)debugForMessage:(nonnull NSString *)message
               category:(nullable NSString *)category;
/**
 * @brief Writes an info message. Use it to log normal app behavior.
 *
 * @param message The log message.
 * @param category An optional string representing a log category.
 */
+ (void)infoForMessage:(nonnull NSString *)message
              category:(nullable NSString *)category;
/**
 * @brief Writes a warning. Use it to output data in a situation that might be a problem, or in an unusual situation.
 *
 * @param message The log message.
 * @param category An optional string representing a log category.
 */
+ (void)warningForMessage:(nonnull NSString *)message
                 category:(nullable NSString *)category;
/**
 * @brief Writes an error message. Use it to output data when a significant error occured.
 *
 * @param message The log message.
 * @param category An optional string representing a log category.
 */
+ (void)errorForMessage:(nonnull NSString *)message
               category:(nullable NSString *)category;

@end
