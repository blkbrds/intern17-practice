//
//  DetailViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/18/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class DetailViewModel {

    // MARK: - Private functions
    var featuredVideo: Video?
    var nominationVideo: Video?
    var newVideo: Video?
    var type: HomeViewModel.CellType
    var videos: [Video] = []

    // MARK: - init
    init(featuredVideo: Video?, nominationVideo: Video?, newVideo: Video?, type: HomeViewModel.CellType) {
        self.featuredVideo = featuredVideo
        self.nominationVideo = nominationVideo
        self.newVideo = newVideo
        self.type = type
    }

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> DetailCellViewModel {
        return DetailCellViewModel(video: videos[indexPath.row])
    }

    func getId() -> String {
        var id = ""
        switch type {
        case .featured:
            id = featuredVideo?.id ?? ""
        case .nomination:
            id = nominationVideo?.id ?? ""
        case .new:
            id = newVideo?.id ?? ""
        }
        return id
    }

    func loadAPIDetail(id: String? = nil, completion: @escaping APICompletion) {
        var videoID = ""
        if let id = id {
            videoID = id
        } else {
            videoID = getId()
        }
        let urlString = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=30&relatedToVideoId=\(videoID)&type=video&key=AIzaSyCse0aAqAFAuuXQUesyaEQPX4YEgY4KKoc"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                self.videos = []
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.videos.append(Video(jsonNominationVideo: item))
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
