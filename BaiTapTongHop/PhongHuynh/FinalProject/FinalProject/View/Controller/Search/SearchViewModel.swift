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
    var nextPageToken: String?

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
        VideoService.loadSearchVideoAPI(keyword: keyword, completion: { items, error in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.searchsVideo = items
                completion(.success)
            }
        })
    }

    func loadMoreSearchVideoAPI(nextPageToken: String, completion: @escaping APICompletion) {
        VideoService.loadMoreSearchAPI(nextPageToken: nextPageToken, completion: { items, nextPageToken, error in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.searchsVideo = items
                self.nextPageToken = nextPageToken
                completion(.success)
            }
        })
    }
}
