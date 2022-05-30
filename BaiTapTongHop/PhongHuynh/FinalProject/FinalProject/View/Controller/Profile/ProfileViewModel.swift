//
//  FrofileViewModel.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/19/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class ProfileViewModel {

    // MARK: - Define
    enum CellType: Int {
        case profile = 0
        case logout
    }

    // MARK: - Methods
    func numberOfItems(section: Int) -> Int {
        return CellType.logout.rawValue + 1
    }
}
