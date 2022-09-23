//
//  FavoriteViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/25/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift

final class FavoriteViewModel {

    // MARK: - Properties
    var videos: [Video] = []
    var objectNotificationToken: NotificationToken?
    var completion: (() -> Void)?

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> FavoriteCellViewModel {
        return FavoriteCellViewModel(video: videos[indexPath.row])
    }

    func viewModelForDetail(indexPath: IndexPath) -> DetailViewModel {
        let videoFavorite: Video = Video()
        videoFavorite.id = videos[indexPath.row].id
        videoFavorite.title = videos[indexPath.row].title
        return DetailViewModel(video: videoFavorite)
    }

    func addObserve() {
        do {
            let realm = try Realm()
            objectNotificationToken = realm.objects(Video.self).observe({ [weak self] change in
                guard let this = self else { return }
                this.videos = realm.objects(Video.self).toArray(ofType: Video.self)
                this.completion?()
            })
        } catch {
            print("error")
        }
    }

    func removeVideo(indexPath: IndexPath) {
        do {
            let realm = try Realm()
            let item = videos[indexPath.row]
            try realm.write {
                realm.delete(item)
                videos.remove(at: indexPath.row)
            }
        } catch {
        }
    }
}

// MARK: - Results
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
