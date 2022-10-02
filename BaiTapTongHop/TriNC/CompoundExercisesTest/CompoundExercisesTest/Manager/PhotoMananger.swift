//
//  PhotoMananger.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 10/05/2022.
//

import UIKit

final class PhotoManager {
    
    // MARK: - singleton
    static var shared: PhotoManager = PhotoManager()
    
    // MARK: - init
    private init() {}
    
    // MARK: - Fetch image
    func fetchImage(completion: @escaping (UIImage?) -> ()) {
        let url = "https://kenh14cdn.com/thumb_w/660/203336854389633024/2021/2/14/13305451537340937166500036199037000332886527n-1613375263372211794836.jpg"
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

