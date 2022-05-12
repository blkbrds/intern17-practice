//
//  PhotoService.swift
//  TabbarController
//
//  Created by tri.nguyen on 12/05/2022.
//

import Foundation
import UIKit

final class PhotoService {
    
    // MARK: - Downloader
    class func downloadImage(url: String, completion: @escaping (Data?) -> Void) {
        
        API.shared().request(urlString: url) { result in
            switch result {
            case .success(let data):
                if let data = data {
                    completion(data)
                } else {
                    completion(nil)
                }
            case .failure:
                completion(nil)
            }
        }
    }
}
