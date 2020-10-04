//
//  AppConfiguration.swift
//  Movielicious
//
//  Created by Abraham Lay on 04/10/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import Foundation

final class AppConfiguration {
    lazy var apiKey: String = {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
            fatalError("ApiKey must not be empty in plist")
        }
        return apiKey
    }()
    lazy var apiBaseUrlProd: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseUrlProd") as? String else {
            fatalError("ApiBaseUrlProd must not be empty in plist")
        }
        return apiBaseURL
    }()
    
    lazy var apiBaseUrlQA: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseUrlQA") as? String else {
            fatalError("ApiBaseUrlQA must not be empty in plist")
        }
        return apiBaseURL
    }()
    
    lazy var apiBaseUrlStaging: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseUrlStaging") as? String else {
            fatalError("ApiBaseUrlStaging must not be empty in plist")
        }
        return apiBaseURL
    }()
    
    lazy var imagesBaseURL: String = {
        guard let imageBaseURL = Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return imageBaseURL
    }()
}
