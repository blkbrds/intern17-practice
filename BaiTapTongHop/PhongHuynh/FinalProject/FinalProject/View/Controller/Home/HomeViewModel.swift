//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/12/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class HomeViewModel {
    
    var videos: [Video] = []

    func numberOfItems(section: Int) -> Int {
        return videos.count
    }
    
    func viewModelForItem(indexPath: IndexPath) -> HomeCellViewModel {
        return HomeCellViewModel(video: videos[indexPath.row])
    }
    
    func loadAPI(completion: @escaping APICompletion) {
        guard let url = URL(string: "https://youtube.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=30&regionCode=VN&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40") else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, responds, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.videos.append(Video(json: item))
                    }
                    completion(.success)
                }
                
                
            } else {
                if let error = error as? Error {
                completion(.failure(error))
                }
            }
        }
        task.resume()
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
