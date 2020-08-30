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
}

class MovieRepositoryImpl: ObservableObject ,MovieRepository {
    var provider: MoyaProvider<MovieAPI> = NetworkManager().self.provider
    
    
    @Published var movieList = MovieList(page: 0,totalResults: 0,totalPages: 0,results: [Movie]())
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
    
}
