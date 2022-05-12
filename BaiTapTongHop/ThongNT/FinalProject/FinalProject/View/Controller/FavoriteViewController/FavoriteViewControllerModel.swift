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
    private var favoritedVideos: [FavoriteVideo] = []
    private var notificationToken: NotificationToken?
    private var snippet: Snippet?

    func fetchData(completion: (Bool) -> Void) {
        do {
            let realm = try Realm()
            let results = realm.objects(FavoriteVideo.self)
            favoritedVideos = Array(results)
            completion(true)
        } catch  {
            completion(false)
        }
    }

    func getFavoriteVideoInfo(with index: Int) -> FavoriteVideo? {
        if 0..<favoritedVideos.count ~= index {
            return favoritedVideos[index]
        } else {
            return nil
        }
    }

    func getVideosCount() -> Int {
        return favoritedVideos.count
    }

    func setupObserve(completion: @escaping DoneInform) {
        do {
            let realm = try Realm()
            notificationToken = realm.objects(FavoriteVideo.self).observe({ change in
                switch change {
                case .update(_, deletions: _, insertions: _, modifications: _):
                    completion(true)
                case .initial(_):
                    break
                case .error(_):
                    break
                }
            })
        } catch {
            completion(false)
        }
    }

    func api(completion: @escaping (Error?) -> Void) {
        guard let ids: [String] = favoritedVideos.compactMap { $0.}
        Youtube.loadVideoByIds(with: [String], completion: <#T##Completion<Videos?>##Completion<Videos?>##(Result<Videos?>) -> Void#>)
    }
}
