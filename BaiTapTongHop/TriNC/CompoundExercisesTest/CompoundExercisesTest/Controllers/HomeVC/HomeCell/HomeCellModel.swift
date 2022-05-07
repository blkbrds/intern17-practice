//
//  HomeCellModel.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import Foundation
import UIKit

final class HomeCellModel {
    
    // MARK: - Properties
    let url = "https://s1.media.ngoisao.vn/resize_580/news/2021/07/31/le-phuong-anh-ngosaovn-1-ngoisaovn-w1536-h2048.jpg"
    
    // MARK: - LoadImage
    func loadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    // callback
                    completion(nil)
                } else {
                    // callback
                    completion(UIImage(data: data!))
                }
            }
        }
        dataTask.resume() // connect
    }
}
