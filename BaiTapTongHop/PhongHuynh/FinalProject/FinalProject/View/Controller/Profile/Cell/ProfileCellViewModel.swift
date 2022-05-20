//
//  ProfileCellViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/19/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class ProfileCellViewModel {
    
    // MARK: - Methods
    func updateImageView(completion: @escaping (UIImage?) -> Void) {
        NetWorking.shared().downloadImage(url: UserDefaults.standard.string(forKey: "image") ?? "") { (image) in
            completion(image)
        }
    }
}
