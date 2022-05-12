//
//  RealmModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/5/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class FavoriteVideo: Object {

    @objc dynamic var id: String = ""
    override static func primaryKey() -> String? {
        return "id"
    }
}
