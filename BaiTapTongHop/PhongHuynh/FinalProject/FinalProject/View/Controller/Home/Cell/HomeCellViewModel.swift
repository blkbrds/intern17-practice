//
//  HomeCellViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/12/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class HomeCellViewModel {

    var video: Video

    init(video: Video) {
        self.video = video
    }
    
    func updateImageView(completion: @escaping (UIImage?) -> Void) {
        Networking.shared().downloadImage(url: video.imageURL ?? "") { (image) in
                completion(image)
            }
        }
}
