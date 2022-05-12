//
//  TitleTableViewCellModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/5/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class TitleTableViewCellModel {

    private var title: String = ""
    private var isLiked: Bool = false
    var isFavorite: ((Bool) -> Void)?

    init(title: String, isLiked: Bool) {
        self.title = title
        self.isLiked = isLiked
    }

    func like() {
        isLiked = !isLiked
        if isLiked {
            isFavorite?(true)
        } else {
            isFavorite?(false)
        }
    } 

    func getStateOfVideo() -> Bool {
        return isLiked
    }

    func getTitle() -> String {
        return title
    }
}
