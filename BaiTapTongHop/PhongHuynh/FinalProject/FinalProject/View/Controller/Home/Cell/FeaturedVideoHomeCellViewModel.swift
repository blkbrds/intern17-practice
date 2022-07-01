//
//  FeaturedVideoHomeCellViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/18/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class FeaturedVideoHomeCellViewModel {

    // MARK: Properties
    var videos: [Video] = []

    // MARK: - init
    init(videos: [Video]) {
        self.videos = videos
    }

    init() {}

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> FeatureCellViewModel {
        return FeatureCellViewModel(video: videos[indexPath.row])
    }
}
