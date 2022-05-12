//
//  API.swift
//  TabbarController
//
//  Created by tri.nguyen on 11/05/2022.
//


import UIKit

// MARK: - Typealias Generic
typealias APICompeltion<T> = (Result<T, APIError>) -> Void

enum APIResult {
    case success(Data?)
    case failure(APIError)
}

struct API {
    
    // MARK: - singleton
    private static var sharedAPI: API = {
        let api = API()
        return api
    }()
    
    static func shared() -> API {
        return sharedAPI
    }
    
    // MARK: - init
    private init() {}
}
