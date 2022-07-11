//
//  ProfileViewController.swift
//  TabbarController
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/11/22.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }
    
    @IBAction private func logoutButtonTouchUpInside(_ sender: Any) {
        let scene = UIApplication.shared.connectedScenes.first
        if let sceneDelegate : SceneDelegate = (scene?.delegate as? SceneDelegate) {
            sceneDelegate.changeScreen(type: .login)
        }
    }
    
}
