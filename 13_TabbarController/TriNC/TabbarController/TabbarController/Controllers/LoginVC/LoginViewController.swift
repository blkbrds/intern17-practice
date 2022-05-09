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
    
    // MARK: - Properties
    private var loginViewModel = LoginViewModel(email: "", password: "")
    
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
    
    // MARK: - Private Function
    private func updateView() {
        emailTextField.text = loginViewModel.email
        passwordTextField.text = loginViewModel.password
    }
    
    // MARK: - IBACtions
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
                self.updateView()
                
                // change root
                let scene = UIApplication.shared.connectedScenes.first
                if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sd.changeScreen(type: .tabbar)
                }
                
            case .failure(let isError, let errMsg):
                if isError {
                    print("Dang Nhap That Bai")
                    print(errMsg)
                }
            }
        }
        loginViewModel.login(email: email, password: password, completion: complete)
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
