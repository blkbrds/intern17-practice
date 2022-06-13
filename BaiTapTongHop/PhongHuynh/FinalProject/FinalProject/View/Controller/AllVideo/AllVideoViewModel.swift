//
//  AllVideoViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 6/9/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class AllVideoViewModel {

    // MARK: - Properties
    var type: HomeViewModel.CellType
    var videos: [Video] = []

    // MARK: - init
    init(type: HomeViewModel.CellType = .nomination) {
        self.type = type
    }

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> NominationCellViewModel {
        return NominationCellViewModel(video: videos[indexPath.row])
    }

    func viewModelForDetail(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(video: videos[indexPath.row])
    }

    func loadNominationVideoAPI(completion: @escaping APICompletion) {
        VideoService.loadVideoNominationAPI(maxResults: 20) { items, error in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.videos = items
                completion(.success)
            }
        }
    }

    func loadNewVideoAPI(completion: @escaping APICompletion) {
        VideoService.loadVideoNewAPI(maxResults: 20) { items, error in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.videos = items
                completion(.success)
            }
        }
    }
}
