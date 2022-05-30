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

    // MARK: - Properties
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

    func loadVideoTrendingAPI(completion: @escaping APICompletion) {
        VideoService.loadVideoTrendingAPI { (result) in
            switch result {
            case .success(let json):
                guard let json = json as? JSON else { return }
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.featureVideos.append(Video(json: item))
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
                    for item in items {
                        self.nominationVideos.append(Video(json: item))
                    }
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
                        self.newVideos.append(Video(json: item))
                    }
                    completion(.success)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
