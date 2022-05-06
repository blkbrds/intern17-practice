//
//  RealmModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/5/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class FavoriteVideos: Object {

    @objc dynamic var id: String = ""
    @objc dynamic var videoInfo: VideoInfo?
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class VideoInfo: Object {

    @objc dynamic var title: String = ""
    @objc dynamic var publishAt: String = ""
    @objc dynamic var imageString: String = ""
}
