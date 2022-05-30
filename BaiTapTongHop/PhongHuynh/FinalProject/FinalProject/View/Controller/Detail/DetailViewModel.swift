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
        VideoService.loadDetailAPI(id: videoID) { (result) in
            switch result {
            case .success(let json):
                guard let json = json as? JSON else { return }
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.videos.append(Video(json: item))
                    }
                    completion(.success)
                }
            case .failure(let error):
                completion(.failure(error))
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
