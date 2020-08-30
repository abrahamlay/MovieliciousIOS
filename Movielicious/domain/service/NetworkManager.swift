//
//  NetworkManager.swift
//  Movielicious
//
//  Created by Abraham Lay (ID) on 30/08/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import Foundation
import Moya

enum APIEnvirontment {
    case staging
    case qa
    case production
}

struct NetworkManager {
    let provider = MoyaProvider<MovieAPI>(plugins:[NetworkLoggerPlugin()])
    static let environtment : APIEnvirontment = .production
    static let MovieAPIKey = "e1364e3bc8f9d46c4a09586973081f96"
}
