//
//  LoginViewController.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import UIKit

final class LoginViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI
    override func setupUI() {
        title = "Login"
        loginButton.layer.cornerRadius = 12
        loginButton.clipsToBounds = true
    }
    
    // MARK: - IBACtions
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        if let sceneDelegate: SceneDelegate = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate) {
            sceneDelegate.changeScreen(type: .tabbar)
        }
    }
    
    @IBAction private func registerButtonTouchUpInside(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func forgotPassWordButtonTouchUpInside(_ sender: Any) {
        let vc = ForgotViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
