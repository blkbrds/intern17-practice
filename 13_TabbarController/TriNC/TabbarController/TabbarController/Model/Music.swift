//
//  Music.swift
//  TabbarController
//
//  Created by tri.nguyen on 11/05/2022.
//

import Foundation
import UIKit

final class Music {
    
    // MARK: - Properties
    var artistName: String
    var name: String
    var artworkUrl100: String
    var thumbnailImage: UIImage?
    
    // MARK: - init
    init(json: JSON) {
        self.artistName = json["artistName"] as! String
        self.name = json["name"] as! String
        self.artworkUrl100 = json["artworkUrl100"] as! String
    }
}
