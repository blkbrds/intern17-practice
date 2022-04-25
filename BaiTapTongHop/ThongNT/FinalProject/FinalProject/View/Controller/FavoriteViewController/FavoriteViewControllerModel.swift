//
//  FavoriteViewControllerModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/22/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class FavoriteViewControllerModel {

    var video: Videos?

    func loadApi() {

    }

    func getVideo(with index: Int) -> Snippet? {
        guard let video = video else { return nil }
        guard index >= 0, index < video.items.count else { return nil }
        return video.items[index]
    }
}
