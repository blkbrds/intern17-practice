//
//  Music.swift
//  TabbarController
//
//  Created by tri.nguyen on 11/05/2022.
//

import Foundation
import UIKit

final class Music: Codable {
    
    // MARK: - Properties
    var id: Int = 0
    var artistName: String = ""
    var name: String = ""
    var artworkUrl100: String = ""
    var thumbnailImageURLString: String = ""
    
    // MARK: - init
    init(json: JSON) {
        self.artistName = json["artistName"] as? String ?? ""
//        if let artisName = json["artistName"] as? String {
//            self.artistName = artisName
//        } else {
//            self.artistName = ""
//        }
        self.name = json["name"] as? String ?? ""
        self.artworkUrl100 = json["artworkUrl100"] as? String ?? ""
    }

    /// { "id": 12345,
    ///  "artist_name": "Ho Quang Hieu",
    ///  "name": "Ho Quang Hieu",
    ///  "art_work": "Ho Quang Hieu",
    ///  "thumbnail_image": "Ho Quang Hieu"
    ///  }

//    enum CodingKeys: String, CodingKey {
//        case id
//        case artistName = "artist_name"
//        case name
//        case artworkUrl100 = "art_work"
//        case thumbnailImageURLString = "thumbnail_image"
//    }
}
