//
//  User.swift
//  Test
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/20/22.
//

import Foundation
import  UIKit

final class User {

    var name: String
    var birthday: String
    var avatarImage: String

    init(name: String, birthday: String, avatarImage: String) {
        self.name = name
        self.birthday = birthday
        self.avatarImage = avatarImage
    }
}
