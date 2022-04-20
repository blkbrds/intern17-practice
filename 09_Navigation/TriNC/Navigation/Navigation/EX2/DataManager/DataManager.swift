//
//  DataManager.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import Foundation

final class DataManager {
    
    // MARK: - Function
    static func checkData(userName: String, password: String) -> Bool {
        if let path = Bundle.main.path(forResource: "User", ofType: "plist"),
           let myDict = NSDictionary(contentsOfFile: path) {
            for dict in myDict {
                if dict.key as! String == userName {
                    return dict.value as! String == password
                }
            }
        }
        return false
    }
}
