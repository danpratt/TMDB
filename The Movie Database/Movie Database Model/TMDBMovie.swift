//
//  TMDBMovie.swift
//  The Movie Database
//
//  Created by Daniel Pratt on 11/2/18.
//  Copyright © 2018 Blau Magier. All rights reserved.
//

import Foundation

enum genre: Int {
    case Action = 28
    case Adventure = 12
    case Animation = 16
    case Comedy = 35
    case Crime = 80
    case Documentary = 99
    case Drama = 18
    case Family = 10751
    case Fantasy = 14
    case History = 36
    case Horror = 27
    case Music = 10402
    case Mystery = 9648
    case Romance = 10749
    case ScienceFiction = 878
    case TVMovie = 10770
    case Thriller = 53
    case War = 10752
    case Western = 37
}

struct Movie {
    
    var posterPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
    var genreIDs: [Int]?  // change to enum later
    var id: Int?
    var originalTitle: String?
    var originalLanguage: String?
    var title: String?
    var backdroPath: String?
    var popularity: String?
    var voteCount: String?
    var video: String?
    var voteAverage: String?
    
}

extension Movie: Codable {
    
    func decode(jsonString: String) -> Movie? {
        let jsonData = jsonString.data(using: .utf8)
        let decoder = JSONDecoder()
        do {
            let movie = try decoder.decode(Movie.self, from: jsonData!)
            return movie
        } catch {
            return nil
        }
    }
    
}
