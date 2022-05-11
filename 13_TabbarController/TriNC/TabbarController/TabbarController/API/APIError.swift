//
//  APIError.swift
//  TabbarController
//
//  Created by tri.nguyen on 11/05/2022.
//

import Foundation

// MARK: - Define Error
enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is Error"
        }
    }
}
