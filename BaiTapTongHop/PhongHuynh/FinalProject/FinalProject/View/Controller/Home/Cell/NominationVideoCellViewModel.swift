//
//  NominationVideoCellViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import UIKit

final class NominationVideoCellViewModel {

    // MARK: Properties
    var videos: [Video]

    // MARK: - Init
    init(videos: [Video]) {
        self.videos = videos
    }
    
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> NominationCellViewModel {
        return NominationCellViewModel(video: videos[indexPath.row])
    }
}
