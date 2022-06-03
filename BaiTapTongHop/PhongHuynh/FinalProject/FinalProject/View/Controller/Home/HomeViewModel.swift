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
        VideoService.loadVideoTrendingAPI { items, error  in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.datas[.featured] = items
                completion(.success)
            }
        }
    }

    func loadNominationVideoAPI(completion: @escaping APICompletion) {
        VideoService.loadVideoNominationAPI { items, error in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.datas[.nomination] = items
                completion(.success)
            }
        }
    }

    func loadNewVideoAPI(completion: @escaping APICompletion) {
        VideoService.loadVideoNewAPI { items, error in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.datas[.new] = items
                completion(.success)
            }
        }
    }
}
