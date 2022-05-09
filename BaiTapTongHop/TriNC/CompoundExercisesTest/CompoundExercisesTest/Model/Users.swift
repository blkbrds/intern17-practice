//
//  Users.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import Foundation

// MARK: - Model
struct User {
    var name: String
    var date: String    
}

// MARK: - Extention
extension User {
    static func getDummyData() -> [User] {
        var users: [User] = []
        for i in 1...5 {
            let user = User(name: "Hello \(i)", date: "1/2/1996")
            users.append(user)
        }
        return users
    }
}
