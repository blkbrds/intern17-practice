//
//  SearchCellViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/23/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class SearchCellViewModel {

    // MARK: Properties
    var video: Video

    // MARK: - init
    init(video: Video) {
        self.video = video
    }

    // MARK: - Methods
    func updateImageView(completion: @escaping (UIImage?) -> Void) {
        NetWorking.shared().downloadImage(url: video.imageURL ?? "") { (image) in
            completion(image)
        }
    }
}