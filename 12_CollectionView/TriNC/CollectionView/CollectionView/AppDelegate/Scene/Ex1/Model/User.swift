//
//  User.swift
//  CollectionView
//
//  Created by tri.nguyen on 16/05/2022.
//

import UIKit

// MARK: - Model
final class User {
    
    // MARK: - Properties
    var number: String
    
    // init
    init(number: String) {
        self.number = number
    }
}

// MARK: - Dummy Data
extension User {
    static func getDummyData() -> [User] {
        var users: [User] = []
        for i in 0...49 {
            let user = User(number: "\(i)")
            users.append(user)
        }
        return users
    }
}
