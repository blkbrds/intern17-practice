//
//  ProfileViewController.swift
//  TabBar
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/11/22.
//

import UIKit

final class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }

    // MARK: - IBAction
    @IBAction private func logOutButtonTouchUpInside(_ sender: Any) {
        changeRoot(type: .login)
    }
}
