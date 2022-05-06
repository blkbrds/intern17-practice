//
//  FavoriteViewControllerModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/5/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class FavoriteViewControllerModel {

    // MARK: Private Properties
    private var favoritedVideos: [FavoriteVideos] = []

    func fetchData(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(FavoriteVideos.self)
            favoritedVideos = Array(results)
            completion(true)
        } catch  {
            completion(false)
        }
    }

    func getFavoriteVideoInfo(with index: Int) -> FavoriteVideos? {
        if 0..<favoritedVideos.count ~= index {
            return favoritedVideos[index]
        } else {
            return nil
        }
    }

    func getVideosCount() -> Int {
        return favoritedVideos.count
    }
}
