//
//  flickr.swift
//  study-quiz
//
//  Created by David Bielenberg on 2019-11-21.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation

struct Constants {
    
    struct FlickrURLParams {
        static let APIScheme = "https"
        static let APIHost = "api.flickr.com"
        static let APIPath = "/services/rest"
    }
}
struct FlickrAPIKeys {
    static let SearchMethod = "method"
    static let APIKey = "api_key"
    static let Extras = "extras"
    static let ResponseFormat = "format"
    static let DisableJSONCallback = "nojsoncallback"
    static let SafeSearch = "safe_search"
    static let Text = "text"
}

struct FlickrAPIValues {
    static let SearchMethod = "flickr.photos.search"
    static let APIKey = "101796e68db863912e66eebb072a223b"
    static let ResponseFormat = "json"
    static let DisableJSONCallback = "1"
    static let MediumURL = "url_m"
    static let SafeSearch = "1"
}
