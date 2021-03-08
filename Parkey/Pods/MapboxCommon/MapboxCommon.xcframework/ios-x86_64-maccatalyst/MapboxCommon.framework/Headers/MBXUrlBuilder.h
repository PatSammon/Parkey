// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXUrlScheme.h"
@class MBXExpected;

@class MBXUrl;

/** @brief Class which helps to construct an URL address by providing convenient method to set host, port, path and query parameters. */
NS_SWIFT_NAME(UrlBuilder)
__attribute__((visibility ("default")))
@interface MBXUrlBuilder : NSObject

- (nonnull instancetype)init;
/**
 * @brief Sets the scheme.
 * @param scheme Sometimes referred to as protocol, A URL’s scheme describes what mechanism should be used to retrieve the resource.
 *               Although URLs have many schemes (mailto, file, ftp), this class only supports http, https and mapbox.
 */
- (void)schemeForScheme:(MBXUrlScheme)scheme;
/**
 * @brief Sets the host.
 * @param host The host identifies the webserver that serves the URL’s resource.
 *             It is either a hostname like mapbox.com or localhost, an IPv4 address like 192.168.0.1, or an IPv6 address like ::1.
 */
- (void)hostForHost:(nonnull NSString *)host;
/**
 * @brief Set the port.
 * @param port The port used to connect to the web server.
 */
- (void)portForPort:(uint16_t)port;
/**
 * @brief The path identifies a specific resource on the host.
 *        Paths have a hierarchical structure like “/a/b/c/42” and decompose into a list of segments like ["a", "b", "c", "42"].
 *        This class composes each path from a list of segments by alternating between “/” and the encoded segment.
 *        For example the segments ["a", "b"] build “/a/b” and the segments ["a", "b", ""] build “/a/b/”.
 *        If a path’s last segment is the empty string then the path ends with “/”. This class always builds non-empty paths: if the path is omitted it defaults to “/”.
 *        The default path’s segment list is a single empty string: [""].
 * @param segment New segment.
 */
- (void)addPathSegmentForSegment:(nonnull NSString *)segment;
/**
 * @brief A query string is a part of a URL that assigns values to specified parameters.
 *        This function allows to add query parameter to the constructing URL. This class offers methods to set the query as the single string, or as individual name-value parameters.
 *        With name-value parameters the values are optional and names may be repeated.
 * @param name The name of adding parameter.
 * @param value The value of adding parameter, if it is set to empty string then only name is inserted to the query parameter list.
 */
- (void)addQueryParameterForName:(nonnull NSString *)name
                           value:(nonnull NSString *)value;
/**
 * @brief Constructs new URL.
 * @return URL, in case of error string describing an error.
 */
- (nonnull MBXExpected *)build __attribute((ns_returns_retained));

@end
