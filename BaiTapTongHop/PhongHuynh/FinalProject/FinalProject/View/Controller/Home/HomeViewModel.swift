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

        var title: String {
            switch self {
            case .nomination:
                return "Sự kiện"
            case .new:
                return "Video mới"
            case .featured:
                return ""
            }
        }
    }

    // MARK: - Properties
    var datas: [CellType: [Video]] = [
        .featured: [],
        .nomination: [],
        .new: []
    ]

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return datas.count
    }

    func viewModelForFeaturedVideo(indexPath: IndexPath) -> FeaturedVideoHomeCellViewModel {
        guard let videos = datas[.featured] else { return FeaturedVideoHomeCellViewModel() }
        return FeaturedVideoHomeCellViewModel(videos: videos)
    }

    func viewModelForNomination(indexPath: IndexPath) -> NominationVideoCellViewModel {
        guard let cellType = CellType(rawValue: indexPath.row), let videos = datas[cellType], indexPath.row != 0 else { return NominationVideoCellViewModel() }
        return NominationVideoCellViewModel(videos: videos, type: cellType)
    }

    func viewModelForDetail(cellType: CellType, indexPath: IndexPath) -> DetailViewModel {
        guard let videos = datas[cellType] else { return DetailViewModel() }
        return DetailViewModel(video: videos[indexPath.row])
    }

    func loadVideoTrendingAPI(completion: @escaping APICompletion) {
        VideoService.loadVideoTrendingAPI { (result) in
            switch result {
            case .success(let json):
                guard let json = json as? JSON else { return }
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.datas[.featured]?.append(Video(json: item))
                    }
                    completion(.success)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func loadNominationVideoAPI(completion: @escaping APICompletion) {
        VideoService.loadVideoNominationAPI { (result) in
            switch result {
            case .success(let json):
                guard let json = json as? JSON else { return }
                if let items = json["items"] as? [JSON] {
                    var videos: [Video] = []
                    for item in items {
                        videos.append(Video(json: item))
                    }
                    self.datas[.nomination] = videos
                    completion(.success)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func loadNewVideoAPI(completion: @escaping APICompletion) {
        VideoService.loadVideoNewAPI { (result) in
            switch result {
            case .success(let json):
                guard let json = json as? JSON else { return }
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.datas[.new]?.append(Video(json: item))
                    }
                    completion(.success)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
