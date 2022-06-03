//
//  Video.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import ObjectMapper
import RealmSwift

typealias JSON = [String: Any]
typealias HUD = SVProgressHUD

final class Video: Object, Mappable {

    // MARK: - Properties
    @objc dynamic var id: String?
    @objc dynamic var imageURL: String?
    @objc dynamic var title: String?
    @objc dynamic var descriptionn: String?

    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }

    func mapping(map: ObjectMapper.Map) {
        var idTemp: String?
        idTemp <- map["id"]
        if idTemp != nil {
            id = idTemp
        } else {
            id <- map["id.videoId"]
        }
        title <- map["snippet.title"]
        descriptionn <- map["snippet.description"]
        imageURL <- map["snippet.thumbnails.medium.url"]
    }
}
