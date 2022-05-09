//
//  HomeViewModel.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import Foundation

final class HomeViewModel {
    
    // MARK: - Properties
    var email: String = ""
    var password: String = ""
    
    // MARK: - Fetch Data
    func fetchData(completion: (Bool, String, String) -> ()) {
        let data = DataManager.shared().read()
        let email = data.0
        let password = data.1
        
        if email != "" || password != "" {
            // save Data
            self.email = email
            self.password = password
            
            // callback
            completion(true, email, password)
        } else {
            // callback
            completion(false, "", "")
        }
    }
}
