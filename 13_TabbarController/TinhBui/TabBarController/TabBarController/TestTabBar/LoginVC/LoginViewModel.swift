//
//  LoginViewModel.swift
//  TabBarController
//
//  Created by Tinh Bui T. VN.Danang on 6/1/22.
//

import Foundation

final class LoginviewModel {
    
    // MARK: - Properties
    var passwork: String = ""
    var username: String = ""
    
    // MARK: - Functions
    func login(username: String, passwork: String) -> Bool {
        if username == "tinh123" && passwork == "123" {
            return true
        }
        return false
    }
}
