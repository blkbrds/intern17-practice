//
//  DataManger.swift
//  Navigation
//
//  Created by dung.nguyen3 on 6/29/22.
//

import Foundation

final class DataManager {
    
    static func checkData(username: String, password: String) -> Bool {
        if let infoPlistPath = Bundle.main.path(forResource: "UserList", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: infoPlistPath) as? [String: String] {
            for config in dict {
                if config.key == username {
                    return config.value == password
                }
            }
        }
        return false
    }
}
