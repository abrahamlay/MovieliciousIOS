//
//  MovieApi.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 30/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
    case popular
}

func stubbedResponses(_ filename: String) -> Data {
    @objc class TestClass : NSObject{}
    
    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try! Data(contentsOf: URL(fileURLWithPath: path!)))
}

extension MovieAPI : TargetType {
    
    var environmentBaseUrl: String {
        switch NetworkManager.environtment {
        case .production:
            return "https://api.themoviedb.org/"
        case .qa:
            return "https://qa.themoviedb.org/"
        case .staging:
            return "https://staging.themoviedb.org/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseUrl) else {
            fatalError("baseUrl could not be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .popular:
            return "3/movie/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popular:
            return .get
        }
    }
    var sampleData: Data {
        switch self {
        case .popular:
            return stubbedResponses("Popular")
        }
    }
    
    var task: Task {
        switch self {
        case .popular:
            return .requestParameters(parameters: ["api_key": NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
        }
        
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
