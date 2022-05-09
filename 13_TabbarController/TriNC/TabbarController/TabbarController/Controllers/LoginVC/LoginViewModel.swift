//
//  LoginViewModel.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import Foundation

final class LoginViewModel {
    
    // MARK: - Enum
    enum LoginResult {
        case success
        case failure(Bool, String)
    }
    
    typealias Completion = (LoginResult) -> Void
    
    // MARK: - Properties
    var email: String = ""
    var password: String = ""
    
    // MARK: - Init
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    // MARK: - Actions
    func login(email: String, password: String, completion: Completion) {
        if email == "" || password == "" {
            // callback
            completion(.failure(true, "Mật khẩu hoặc email rỗng."))
        } else {
            // Update Data
            self.email = email
            self.password = password
            
            // Save Data
            DataManager.shared().save(email: email, password: password)
            
            // callback
            completion(.success)
        }
    }
}
