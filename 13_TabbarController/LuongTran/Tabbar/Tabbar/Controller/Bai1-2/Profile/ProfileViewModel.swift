//
//  ProfileViewModel.swift
//  Tabbar
//
//  Created by luong.tran on 23/09/2022.
//

import Foundation

final class ProfileViewModel {
    // MARK: - Actions
    func destroyDB() {
        DataManager.shared().destroy()
    }
}
