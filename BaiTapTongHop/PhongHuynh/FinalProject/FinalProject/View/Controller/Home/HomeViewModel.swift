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
    var featureVideos: [Video] = []
    var nominationVideos: [Video] = []

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForNomination(indexPath: IndexPath) -> NominationVideoCellViewModel {
        return NominationVideoCellViewModel(videos: nominationVideos)
    }

    func viewModelForNewVideo(indexPath: IndexPath) -> NewVideoHomeCellViewModel {
        return NewVideoHomeCellViewModel(videos: videos)
    }

    func viewModelForFeaturedVideo(indexPath: IndexPath) -> FeaturedVideoHomeCellViewModel {
        return FeaturedVideoHomeCellViewModel(videos: featureVideos)
    }

    func viewModelForDetailNominationVideo(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(video: nominationVideos[indexPath.row])
    }
    
    func viewModelForDetailNewVideo(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(video: videos[indexPath.row])
    }
    
    func viewModelForDetailFeaturedVideo(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(video: featureVideos[indexPath.row])
    }

    func loadNominationVideoAPI(completion: @escaping APICompletion) {
        let urlString = "https://youtube.googleapis.com/youtube/v3/playlists?part=snippet&chart=mostPopular&maxResults=30&regionCode=VN&channelId=UClyA28-01x4z60eWQ2kiNbA&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.nominationVideos.append(Video(json: item))
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
        let urlString = "https://youtube.googleapis.com/youtube/v3/playlists?part=snippet&chart=mostPopular&maxResults=30&regionCode=VN&channelId=UCd0neB_LB1xpwIYDetX2qTg&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40"
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

    func loadVideoTrendingAPI(completion: @escaping APICompletion) {
        let urlString = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=30&regionCode=VN&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.featureVideos.append(Video(json: item))
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
