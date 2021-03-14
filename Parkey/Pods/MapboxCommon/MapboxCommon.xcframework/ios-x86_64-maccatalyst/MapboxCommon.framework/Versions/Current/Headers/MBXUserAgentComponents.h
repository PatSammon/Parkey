// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/**
 * @brief UserAgentComponents holds Application and SDK information for generating User-Agent string.
 *
 * The UA string itself is broken down into four components:
 * 1. Application Name and version - appName/appVersion.
 * 2. Application Identifier and OS Information - (appIdentifier; appBuildNumber; osName osVersion). This will be skipped from UA string, if any one of the field is empty or unknown.
 * 3. SDK Name and Version - sdkName/sdkVersion.
 * 4. SDK Identifier - (sdkIdentifier; sdkBuildNumber). This will be skipped from UA string, if any one of the field is empty or unknown.
 *
 * User Agent String Example: AppName/1.0 (app.bundle.identifier; v1; iOS 13.0.1) MapboxFramework/1.0 (framework.bundle.identifier; v1) Mapbox Common Library/v1.0.0
 *
 * Note that if the User-Agent is already part of the HTTP request headers, we skip the generation using the information provided through the UserAgentComponents.
 */
NS_SWIFT_NAME(UserAgentComponents)
__attribute__((visibility ("default")))
@interface MBXUserAgentComponents : NSObject

- (nonnull instancetype)init;

- (nonnull instancetype)initWithAppName:(nonnull NSString *)appName
                             appVersion:(nonnull NSString *)appVersion
                          appIdentifier:(nonnull NSString *)appIdentifier
                         appBuildNumber:(nonnull NSString *)appBuildNumber
                                 osName:(nonnull NSString *)osName
                              osVersion:(nonnull NSString *)osVersion
                                sdkName:(nonnull NSString *)sdkName
                             sdkVersion:(nonnull NSString *)sdkVersion
                          sdkIdentifier:(nonnull NSString *)sdkIdentifier
                         sdkBuildNumber:(nonnull NSString *)sdkBuildNumber;

/** @brief Application Name (e.g. kCFBundleNameKey on Darwin) */
@property (nonatomic, readonly, nonnull, copy) NSString *appName;

/** @brief Application Version (e.g. may be simple version 1.0) */
@property (nonatomic, readonly, nonnull, copy) NSString *appVersion;

/** @brief Application Identifier (e.g. bundle identifier on Darwin, package name of Android) */
@property (nonatomic, readonly, nonnull, copy) NSString *appIdentifier;

/** @brief Application Build Number (e.g. kCFBundleVersionKey on Darwin) */
@property (nonatomic, readonly, nonnull, copy) NSString *appBuildNumber;

/** @brief OS Name (e.g. iOS or Android) */
@property (nonatomic, readonly, nonnull, copy) NSString *osName;

/** @brief OS Version (e.g 13.1.0) */
@property (nonatomic, readonly, nonnull, copy) NSString *osVersion;

/** @brief SDK/Framework Name (e.g. Maps) */
@property (nonatomic, readonly, nonnull, copy) NSString *sdkName;

/** @brief SDK/Framework Version (e.g v1.0.0) */
@property (nonatomic, readonly, nonnull, copy) NSString *sdkVersion;

/** @brief SDK/Framework Identifier */
@property (nonatomic, readonly, nonnull, copy) NSString *sdkIdentifier;

/** @brief SDK/Framework Build Number */
@property (nonatomic, readonly, nonnull, copy) NSString *sdkBuildNumber;


@end
