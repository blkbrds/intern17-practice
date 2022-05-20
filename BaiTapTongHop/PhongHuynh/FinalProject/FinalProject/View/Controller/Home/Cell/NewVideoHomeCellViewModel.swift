//
//  NewVideoHomeCellViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class NewVideoHomeCellViewModel {

    // MARK: Properties
    var videos: [NominationVideo]

    // MARK: - Init
    init(videos: [NominationVideo]) {
        self.videos = videos
    }

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> NominationCellViewModel {
        return NominationCellViewModel(video: videos[indexPath.row])
    }
}
