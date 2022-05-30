//
//  SearchViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/23/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class SearchViewModel {

    // MARK: Properties
    var searchsVideo: [Video] = []

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return searchsVideo.count
    }

    func viewModelForItem(indexPath: IndexPath) -> SearchCellViewModel {
        return SearchCellViewModel(video: searchsVideo[indexPath.row])
    }

    func viewModelForDetail(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(video: searchsVideo[indexPath.row])
    }

    func loadSearchVideoAPI(keyword: String, completion: @escaping APICompletion) {
        VideoService.loadSearchVideoAPI(keyword: keyword, completion: { (result) in
            switch result {
            case .success(let json):
                guard let json = json as? JSON else { return }
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.searchsVideo.append(Video(json: item))
                    }
                    completion(.success)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
