//
//  PhotoManager.swift
//  TabbarController
//
//  Created by tri.nguyen on 12/05/2022.
//


import UIKit

final class PhotoManager {
    
    // MARK: - singleton
    static let shared = PhotoManager()
    
    // MARK: - init
    private init() {}

    func downloadImage(with urlString: String ,completion: @escaping (Data?) -> Void) {
        PhotoService.downloadImage(url: urlString) { data in
            completion(data)
        }
    }
}
