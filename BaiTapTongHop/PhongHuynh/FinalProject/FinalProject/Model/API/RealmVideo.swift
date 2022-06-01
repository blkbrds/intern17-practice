//
//  RealmVideo.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/24/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmVideo: Object {

    // MARK: - Properties
    @objc dynamic var title: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var id: String = ""

    convenience init(title: String, image: String, id: String) {
        self.init()
        self.title = title
        self.image = image
        self.id = id
    }
}