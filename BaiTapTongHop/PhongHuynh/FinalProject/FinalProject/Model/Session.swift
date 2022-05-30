//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation

let apiKeyYoutube = "apiKeyYoutube"
let loginGmail = "loginGmail"
let userName = "userName"

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
    var isLogin: Bool {
        get {
            return UserDefaults.standard.string(forKey: userName) != nil
        }
    }
}

// MARK: - Protocol
protocol SessionProtocol: class {
}
