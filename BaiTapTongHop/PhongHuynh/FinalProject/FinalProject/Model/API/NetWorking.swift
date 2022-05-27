//
//  NetWorking.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import Foundation

final class NetWorking {

    enum APIError: Error {
        case error(String)
        case errorURL

        var localizedDescription: String {
            switch self {
            case .error(let string):
                return string
            case .errorURL:
                return "URL String is error."
            }
        }
    }

    enum APIResult {
        case success(Data?)
        case failure(APIError)
    }
    
    let customError = NSError(message: "Error Not Define")

    // MARK: - singleton
    private static var sharedNetworking: NetWorking = {
        let networking = NetWorking()
        return networking
    }()

    class func shared() -> NetWorking {
        return sharedNetworking
    }

    // MARK: - init
    private init() {}

    // MARK: - request
    func request(with urlString: String, completion: @escaping (Data?, APIError?) -> Void) {
        guard let url = URL(string: urlString) else {
            let error = APIError.error("URL lỗi")
            completion(nil, error)
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, APIError.error(error.localizedDescription))
                } else {
                    if let data = data {
                        completion(data, nil)
                    } else {
                        completion(nil, APIError.error("Data format is error."))
                    }
                }
            }
        }
        task.resume()
    }

    // MARK: - downloader
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    completion(nil)
                } else {
                    if let data = data {
                        let image = UIImage(data: data)
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }
            }
        }
        task.resume()
    }
}
