//
//  RegisterViewModel.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import Foundation

final class RegisterViewModel {
    
    // MARK: - Enum
    enum RegisterResult {
        case success
        case failure(Bool, String)
    }
    
    typealias Completion = (RegisterResult) -> Void
    
    // MARK: - Properties
    var email: String = ""
    var password: String = ""
    
    // MARK: - Init
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    // MARK: - Actions
    func register(email: String, password: String, completion: Completion) {
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
