//
//  TMDBConstants.swift
//  The Movie Database
//
//  Created by Daniel Pratt on 11/2/18.
//  Copyright © 2018 Blau Magier. All rights reserved.
//

import Foundation

var posterSizes = ["w92", "w154", "w185", "w342", "w500", "w780", "original"]

// MARK: - API Level Constants
struct API {
    static let Key = "7f8fcbdb965eb49eeae775aec0dd31f8"
    
    static let Scheme = "https"
    static let Host = "api.themoviedb.org"
    static let Path = "/3"
}

// MARK: - Parameter Keys
struct ParameterKeys {
    static let ApiKey = "api_key"
    static let SessionID = "session_id"
    static let RequestToken = "request_token"
    static let Query = "query"
    static let Page = "page"
}

struct ImageKeys {
    static let BaseURL = "https://image.tmdb.org/t/p/"
    
    // MARK: Poster Sizes
    struct PosterSizes {
        static let RowPoster = posterSizes[2]
        static let DetailPoster = posterSizes[4]
    }
}

// MARK: - REST API Methods

struct Methods {
    static let NowPlaying = "/movie/now_playing"
}

struct JSONBodyKeys {
    static let Results = "results"
}
