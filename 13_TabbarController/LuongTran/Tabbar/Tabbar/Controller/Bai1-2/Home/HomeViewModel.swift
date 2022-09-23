//
//  HomeViewModel.swift
//  Tabbar
//
//  Created by luong.tran on 23/09/2022.
//

import Foundation

final class HomeViewModel {
    var email: String = ""
    var password: String = ""
    
    func fetchData(completion: (Bool, String, String) -> ()) {
        let data = DataManager.shared().read()
        let email = data.0
        let password = data.1
        
        if email != "" || password != "" {
            //lưu trữ dữ liệu
            self.email = email
            self.password = password
            
            //callback
            completion(true, email, password)
        } else {
            //callback
            completion(false, "", "")
        }
    }
}
