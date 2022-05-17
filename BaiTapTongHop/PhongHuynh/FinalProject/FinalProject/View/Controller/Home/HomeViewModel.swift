//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class HomeViewModel {

    // MARK: - Private functions
    var videos: [Video] = []

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForNomination(indexPath: IndexPath) -> NominationVideoCellViewModel {
        return NominationVideoCellViewModel(videos: videos)
    }
    
    func viewModelForNewVideo(indexPath: IndexPath) -> NewVideoHomeCellViewModel {
        return NewVideoHomeCellViewModel(videos: videos)
    }

    func loadAPI(completion: @escaping APICompletion) {
        let urlString = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=30&regionCode=VN&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.videos.append(Video(json: item))
                    }
                    completion(.success)
                }
            } else {
                if let error = error {
                completion(.failure(error))
                }
            }
        }
    }
    
    func loadNewVideoAPI(completion: @escaping APICompletion) {
        let urlString = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=10&regionCode=VN&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.videos.append(Video(json: item))
                    }
                    completion(.success)
                }
            } else {
                if let error = error {
                completion(.failure(error))
                }
            }
        }
    }

    func convertToJSON(from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
}
