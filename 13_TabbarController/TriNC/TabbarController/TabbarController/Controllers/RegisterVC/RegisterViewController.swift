//
//  RegisterViewController.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import UIKit

final class RegisterViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var createAccountButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI
    override func setupUI() {
        title = "Register"
        createAccountButton.layer.cornerRadius = 12
        createAccountButton.clipsToBounds = true
    }

    // MARK: - IBAction
    @IBAction private func createAccountButtonTouchUpInside(_ sender: Any) {
        // change root
        let scene = UIApplication.shared.connectedScenes.first
        if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            sd.changeScreen(type: .tabbar)
        }
    }
}
