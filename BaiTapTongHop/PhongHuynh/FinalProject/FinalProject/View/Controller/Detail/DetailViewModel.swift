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
    var nominationVideo: NominationVideo?
    var newVideo: NominationVideo?
    var type: HomeViewModel.CellType
    var videos: [Video] = []

    init(featuredVideo: Video?, nominationVideo: NominationVideo?, newVideo: NominationVideo?, type: HomeViewModel.CellType) {
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

    func loadNominationVideoAPIDetail(completion: @escaping APICompletion) {
        let urlString = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=30&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40"
        NetWorking.shared().request(with: urlString) { (data, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                if let items = json["items"] as? [JSON] {
                    for item in items {
                        self.videos.append(Video(json: item))
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
