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

struct Result: Codable {
    
    var page: Int?
    var results: [Movie]?
//    var dates: [String: TMDBDates]?
    var total_pages: Int?
    var total_results: Int?
    
    static func decode(jsonData: Data) -> Result? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(Result.self, from: jsonData)
            return result
        } catch let error {
            print("Failed decoding with error: \(error)")
            return nil
        }
    }
}

struct TMDBDates: Codable {
    var maximum: String?
    var minimum: String?
}

struct Movie: Codable {
    
    var poster_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_title: String?
    var original_language: String?
    var title: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_count: Int?
    var video: Bool?
    var vote_average: Double?
    
}
