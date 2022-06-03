//
//  DetailViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/18/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class DetailViewModel {

    // MARK: - Properties
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

    func checkAddVideoFavorite() -> Bool {
        let realm = try? Realm()
        if let dataFilters = realm?.objects(Video.self).filter("id = %@ ", video?.id).toArray(ofType: Video.self).first {
            try? realm?.write {
                realm?.delete(dataFilters)
            }
            return true
        } else {
            try? realm?.write {
                guard let video = video else {
                    return
                }
                realm?.add(video)
            }
            return false
        }
    }

    func loadAPIDetail(id: String? = nil, completion: @escaping APICompletion) {
        var videoID = ""
        if let id = id {
            videoID = id
        } else {
            videoID = getId()
        }
        VideoService.loadDetailAPI(id: videoID) { items, error in
            if let error = error {
                completion(.failure(error))
            } else if let items = items as? [Video] {
                self.videos = items
                completion(.success)
            }
        }
    }
}
