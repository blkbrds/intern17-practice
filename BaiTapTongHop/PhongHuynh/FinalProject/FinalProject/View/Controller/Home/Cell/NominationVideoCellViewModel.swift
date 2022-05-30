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
    var videos: [Video] = []
    var type: HomeViewModel.CellType = .nomination
    
    init() {}
    
    // MARK: - init
    init(videos: [Video], type: HomeViewModel.CellType = .nomination) {
        self.videos = videos
        self.type = type
    }

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return videos.count
    }

    func viewModelForItem(indexPath: IndexPath) -> NominationCellViewModel {
        return NominationCellViewModel(video: videos[indexPath.row])
    }
}
