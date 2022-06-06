//
//  LogOutCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/30/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class LogOutCell: UITableViewCell {

    // MARK: - IBActions
    @IBAction private func logoutButtonTouchUpInside(_ sender: Any) {
        AppDelegate.shared.setroot(with: .login)
    }
}
