//
//  Movie.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 30/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import Foundation

struct MovieList{
    var page: Int = 0
    var totalResults: Int = 0
    var totalPages: Int = 0
    var results: Array<Movie>

}

extension MovieList : Decodable{
    enum MovieListCodingKeys:String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieListCodingKeys.self)
        page = try container.decode(Int.self, forKey: .page)
        totalResults = try container.decode(Int.self, forKey: .totalResults)
        totalPages = try container.decode(Int.self, forKey: .totalPages)
        results = try container.decode(Array<Movie>.self, forKey: .results)
    }
}



struct Movie : Hashable{
    let voteCount: Int
    let id: Int
    let video: Bool
    let voteAverage: Double
    let title: String?
    let popularity: Double
    let posterPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIds: Array<Int>
    let backdropPath: String?
    let adult: Bool
    let overview: String?
    let releaseDate: String?
}


extension Movie : Decodable {
    enum MovieCodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id
        case video
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        voteCount = try container.decode(Int.self, forKey: .voteCount)
        id = try container.decode(Int.self, forKey: .id)
        video = try container.decode(Bool.self, forKey: .video)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        title = try container.decode(String.self, forKey: .title)
        popularity = try container.decode(Double.self, forKey: .popularity)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
        originalTitle = try container.decode(String.self, forKey: .originalTitle)
        genreIds = try container.decode(Array<Int>.self, forKey: .genreIds)
        backdropPath = try container.decode(String.self, forKey: .backdropPath)
        adult = try container.decode(Bool.self, forKey: .adult)
        overview = try container.decode(String.self, forKey: .overview)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
    }
}
