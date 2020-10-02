//
//  MovieRepository.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 30/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import Foundation
import Moya
import SwiftUI

protocol MovieRepository {
    var provider : MoyaProvider<MovieAPI> { get }
    func getPopular()
//    func getDetail(id: Int)
}

class MovieRepositoryImpl: ObservableObject ,MovieRepository {
    var provider: MoyaProvider<MovieAPI> = NetworkManager().self.provider
    
    init() {
        getPopular()
    }
    
    @Published var movieList = MovieList(page: 0,totalResults: 0,totalPages: 0,results: [Movie]())
//
//    @Published var detailMovie = DetailMovie(adult: false,
//                                             backdropPath: "",
//                                             belongsToCollection: "",
//                                             budget: 0, genres: [Genre](),
//                                             homepage: "",
//                                             id: 0,
//                                             imdbID: "",
//                                             originalLanguage: "",
//                                             originalTitle: "",
//                                             overview: "",
//                                             popularity: 0.0,
//                                             posterPath: "",
//                                             productionCompanies: [ProductionCompany](),
//                                             productionCountries: [ProductionCountry](),
//                                             releaseDate: "",
//                                             revenue: 0,
//                                             runtime: 0,
//                                             spokenLanguages: [SpokenLanguage](),
//                                             status: "",
//                                             tagline: "", title: "",
//                                             video: false,
//                                             voteAverage: 0.0,
//                                             voteCount: 0)
//
    func getPopular() {
        provider.request(.popular){
            result in
            switch result{
                case let .success(response):
                    do{
                        let result = try JSONDecoder().decode(MovieList.self, from: response.data)
                        DispatchQueue.main.async {
                            self.movieList = result
                        }
                        
                    } catch let err{
                        print(err)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func getDetail(id: Int) {
//        provider.request(.detail(id: id)){
//            result in
//            switch result{
//                case let .success(response):
//                    do{
//                        let result = try JSONDecoder().decode(DetailMovie.self, from: response.data)
//                        DispatchQueue.main.async {
//                            self.detailMovie = result
//                        }
//
//                    } catch let err{
//                        print(err)
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
}
