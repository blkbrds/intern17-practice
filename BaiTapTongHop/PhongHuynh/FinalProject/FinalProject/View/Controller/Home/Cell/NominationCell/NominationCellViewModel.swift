//
//  NominationCellViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class NominationCellViewModel {

    // MARK: Properties
    var video: NominationVideo

    // MARK: - Init
    init(video: NominationVideo) {
        self.video = video
    }

    // MARK: - Methods
    func updateImageView(completion: @escaping (UIImage?) -> Void) {
        NetWorking.shared().downloadImage(url: video.imageURL ?? "") { (image) in
            completion(image)
        }
    }
}
