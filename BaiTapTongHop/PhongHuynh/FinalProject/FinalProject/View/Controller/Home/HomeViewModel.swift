//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class HomeViewModel {

    // MARK: - Define
    enum CellType: Int {
        case featured = 0
        case nomination
        case new
    }

    // MARK: - Private functions
    var featureVideos: [Video] = []
    var newVideos: [Video] = []
    var nominationVideos: [Video] = []

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return CellType.new.rawValue + 1
    }

    func viewModelForFeaturedVideo(indexPath: IndexPath) -> FeaturedVideoHomeCellViewModel {
        return FeaturedVideoHomeCellViewModel(videos: featureVideos)
    }

    func viewModelForNomination(indexPath: IndexPath) -> NominationVideoCellViewModel {
        return NominationVideoCellViewModel(videos: nominationVideos)
    }

    func viewModelForNewVideo(indexPath: IndexPath) -> NewVideoHomeCellViewModel {
        return NewVideoHomeCellViewModel(videos: newVideos)
    }

    func viewModelForDetailFeaturedVideo(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(featuredVideo: featureVideos[indexPath.row], nominationVideo: nil, newVideo: nil, type: .featured)
    }

    func viewModelForDetailNominationVideo(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(featuredVideo: nil, nominationVideo: nominationVideos[indexPath.row], newVideo: nil, type: .nomination)
    }

    func viewModelForDetailNewVideo(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(featuredVideo: nil, nominationVideo: nil, newVideo: newVideos[indexPath.row], type: .new)
    }

    func loadNominationVideoAPI(completion: @escaping APICompletion) {
        let urlString = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=40&relatedToVideoId=XtHh0uNscnk&type=video&key=AIzaSyDWgw7njdG6PA3QZ3S8cHIRI3b3xw55c80"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.nominationVideos.append(Video(jsonNominationVideo: item))
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
        let urlString = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=30&relatedToVideoId=jXKR9kl5tR8&type=video&key=AIzaSyDWgw7njdG6PA3QZ3S8cHIRI3b3xw55c80"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.newVideos.append(Video(jsonNominationVideo: item))
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
        let urlString = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=30&relatedToVideoId=&regionCode=VN&key=AIzaSyDWgw7njdG6PA3QZ3S8cHIRI3b3xw55c80"
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
