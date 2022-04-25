//
//  API.Videos.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/20/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import ObjectMapper

struct Youtube {

    // Load most popular videos
    static func loadAPI(completion: @escaping Completion<Videos?>) {
        let urlString = APIPath.Videos().videos
        api.request(method: .get, urlString: urlString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    guard let dataJSON = value as? JSObject else { return }
                    let video = Mapper<Videos>().map(JSON: dataJSON)
                    completion(.success(video))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    // Load data of channel with channel id
    static func loadAPI(withChannel id: String, completion: @escaping Completion<Channel?>) {
        let urlString = APIPath.Channel(channelId: id).channel
        api.request(method: .get, urlString: urlString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let dataJSON = data as? JSObject else { return }
                    let channel = Mapper<Channel>().map(JSON: dataJSON)
                    completion(.success(channel))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    // Load comments of video by video ID
    static func loadAPI(withVideo id: String, completion: @escaping Completion<Comments?>) {
        let urlString = APIPath.Comments(videoId: id).comments
        api.request(method: .get, urlString: urlString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let dataJSON = data as? JSObject else { return }
                    let comments = Mapper<Comments>().map(JSON: dataJSON)
                    completion(.success(comments))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

//    static func loadAPI(with id: String, completion: @escaping Completion<Videos?>) {
//        let urlString = APIPath.Videos.init(videoId: id).video
//        api.request(method: .get, urlString: urlString) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let value):
//                    guard let dataJSON = value as? JSObject else { return }
//                    let video = Mapper<Videos>().map(JSON: dataJSON)
//                    completion(.success(video))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//        }
//    }

    // Download image with url
    static func downloadImage(with url: String, completion: @escaping Completion<UIImage?>) {
        api.request(method: .get, urlString: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let imageData):
                    guard let data = imageData as? Data else { return }
                    completion(.success(UIImage(data: data)))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
