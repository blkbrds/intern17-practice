//
//  HomeCellViewModel.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 08/05/2022.
//

import UIKit

final class HomeCellViewModel {
    
    // MARK: - Properties
    private let url = "https://kenh14cdn.com/thumb_w/660/203336854389633024/2021/2/14/13305451537340937166500036199037000332886527n-1613375263372211794836.jpg"
    
    // MARK: - LoadImage
    func loadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            // Main Thread
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
