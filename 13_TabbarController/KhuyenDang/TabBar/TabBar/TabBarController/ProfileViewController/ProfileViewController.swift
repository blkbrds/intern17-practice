//
//  ProfileViewController.swift
//  TabBar
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/11/22.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }

    // MARK: - IBAction
    @IBAction private func logOutButtonTouchUpInside(_ sender: Any) {
        let scene = UIApplication.shared.connectedScenes.first
        if let sceneDelegate : SceneDelegate = (scene?.delegate as? SceneDelegate) {
            sceneDelegate.changeScreen(type: .login)
        }
    }
}
