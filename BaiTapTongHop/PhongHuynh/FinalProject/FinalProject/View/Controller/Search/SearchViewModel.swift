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
    var video: Video?

    init() {}

    init(video: Video) {
        self.video = video
    }

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

    func getNextPageToken() -> String {
        guard let pagetoken = video?.pagetoken else { return "" }
        return pagetoken
    }

    func loadMoreSearchVideoAPI(nextPageToken: String? = nil, keyword: String, completion: @escaping APICompletion) {
        var pagetoken = ""
        if let nextPageToken = nextPageToken {
            pagetoken = nextPageToken
        } else {
            pagetoken = getNextPageToken()
        }
        VideoService.loadMoreSearchAPI(nextPageToken: pagetoken, keyword: keyword, completion: { items, error in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.searchsVideo = items
                completion(.success)
            }
        })
    }
}
