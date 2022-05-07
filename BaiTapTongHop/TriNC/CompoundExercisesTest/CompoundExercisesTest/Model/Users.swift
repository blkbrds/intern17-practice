//
//  Users.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import Foundation

// MARK: - Model
struct User {
    let name: String
    let date: String
}

// MARK: - Extention
extension User {
    static func getDummyData() -> [User] {
        var users: [User] = []
        for i in 1...3 {
            let user = User(name: "Name \(i)", date: "18/08/1998")
            users.append(user)
        }
        return users
    }
}
