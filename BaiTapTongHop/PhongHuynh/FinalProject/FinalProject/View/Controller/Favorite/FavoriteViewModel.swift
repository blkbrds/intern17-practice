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
    var videos: [RealmVideo] = []

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> FavoriteCellViewModel {
        return FavoriteCellViewModel(video: videos[indexPath.row])
    }

    func removeVideo(indexPath: IndexPath) {
        videos.remove(at: indexPath.row)
    }

    func viewModelForDetail(indexPath: IndexPath) -> DetailViewModel {
        let videoFavorite: Video = Video()
        videoFavorite.id = videos[indexPath.row].image
        videoFavorite.title = videos[indexPath.row].title
        return DetailViewModel(video: videoFavorite)
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
