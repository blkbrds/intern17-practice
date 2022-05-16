//
//  ProfileViewController.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import UIKit

final class ProfileViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI
    override func setupUI() {
        title = "Profile"
        loginButton.layer.cornerRadius = 12
        loginButton.clipsToBounds = true
    }
    
    // MARK: - IBAction
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        // change root
        if let sceneDelegate: SceneDelegate = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate) {
            sceneDelegate.changeScreen(type: .login)
        }
    }
}
