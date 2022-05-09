//
//  ProfileViewController.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }
    
    // MARK: - IBAction
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        // change root
        let scene = UIApplication.shared.connectedScenes.first
        if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            sd.changeScreen(type: .login)
        }
    }
}
