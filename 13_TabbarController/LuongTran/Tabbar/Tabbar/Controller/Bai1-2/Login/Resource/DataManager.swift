//
//  DataManager.swift
//  Tabbar
//
//  Created by luong.tran on 23/09/2022.
//

import Foundation

class DataManager {
    
    //singleton
    private static var sharedDataManager: DataManager = {
        let dataManager = DataManager()
        return dataManager
    }()
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
    
    // init
    private init() {}
    
    //open database
    func read() -> (String, String) {
        let email = UserDefaults.standard.string(forKey: "email") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        return (email, password)
    }
    
    //save database
    func save(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    }
    
    //detstroy database
    func destroy() {
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "password")
        UserDefaults.standard.synchronize()
    }
}
