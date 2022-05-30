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
    var login: String {
        get {
            return UserDefaults.standard.string(forKey: loginGmail) ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: loginGmail)
        }
    }
}

// MARK: - Protocol
protocol SessionProtocol: class {
}
