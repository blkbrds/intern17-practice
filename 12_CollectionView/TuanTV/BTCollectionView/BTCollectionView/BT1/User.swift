//
//  User.swift
//  BTCollectionView
//
//  Created by Tuan Tran V. VN.Danang on 5/27/22.
//

import Foundation

struct User {
    var avatar: String
    var name: String
}

extension User {
    static func getDummyDatas() -> [User] {
        var users: [User] = []
        for i in 1...49 {
            let user = User(avatar: "user", name: "\(i)")
            users.append(user)
        }
        return users
    }
}
