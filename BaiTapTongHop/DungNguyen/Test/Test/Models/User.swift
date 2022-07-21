//
//  User.swift
//  Test
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/20/22.
//

import Foundation

final class User {
    var avatar: String?
    var name: String?
    var birthday: String?
    
    init() {}
    
    init(avatar: String, name: String, birthday: String) {
        self.avatar = avatar
        self.name = name
        self.birthday = birthday
    }
}

