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

    func viewModelForDetailNominationVideo(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(featuredVideo: nil, nominationVideo: searchsVideo[indexPath.row], newVideo: nil, type: .nomination)
    }

    func loadSearchVideoAPI(keyword: String, completion: @escaping APICompletion) {
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=\(keyword)&type=video&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    self.searchsVideo = []
                    for item in items {
                        self.searchsVideo.append(Video(jsonNominationVideo: item))
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
