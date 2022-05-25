//
//  FavoriteCellViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/25/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

final class FavoriteCellViewModel {

    // MARK: Properties
    var video: RealmVideo

    // MARK: - Init
    init(video: RealmVideo) {
        self.video = video
    }

    // MARK: - Methods
    func updateImageView(completion: @escaping (UIImage?) -> Void) {
        NetWorking.shared().downloadImage(url: video.image) { (image) in
            completion(image)
        }
    }
}
