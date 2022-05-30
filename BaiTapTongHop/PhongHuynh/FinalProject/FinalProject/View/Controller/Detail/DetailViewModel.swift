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
    var videos: [Video] = []
    var video: Video?
    
    init() { }

    // MARK: - init
    init(video: Video) {
        self.video = video
    }

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> DetailCellViewModel {
        return DetailCellViewModel(video: videos[indexPath.row])
    }

    func getId() -> String {
        guard let id = video?.id else { return "" }
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
                    var videos: [Video] = []
                    for item in items {
                        videos.append(Video(json: item))
                    }
                    self.videos = videos
                    completion(.success)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
