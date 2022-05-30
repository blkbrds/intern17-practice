//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation

let apiKeyYoutube = "apiKeyYoutube"

final class Session {

    static let shared = Session()

    private init() {}

    var apiKey: String {
        get {
            return UserDefaults.standard.string(forKey: apiKeyYoutube) ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: apiKeyYoutube)
        }
    }
}

// MARK: - Protocol
protocol SessionProtocol: class {
}
