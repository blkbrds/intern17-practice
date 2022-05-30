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

typealias JSON = [String: Any]
typealias HUD = SVProgressHUD

final class Video {

    // MARK: - Properties
    var id: String?
    var imageURL: String?
    var title: String?
    var description: String?

    // MARK: - Init
    init(json: JSON) {
        if let id = json["id"] as? String {
            self.id = id
        } else if let id = json["id"] as? JSON, let videoId = id["videoId"] as? String {
            self.id = videoId
        }
        if let snippet = json["snippet"] as? JSON,
           let title = snippet["title"] as? String,
           let description = snippet["description"] as? String,
           let thumbnails = snippet["thumbnails"] as? JSON,
           let medium = thumbnails["medium"] as? JSON,
           let imageURL = medium["url"] as? String {
            self.title = title
            self.description = description
            self.imageURL = imageURL
        }
    }
}
