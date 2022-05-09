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
    
    // MARK: - Properties
    private var registerViewModel = RegisterViewModel(email: "", password: "")
    
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
    
    // MARK: - Private Function
    private func updateView() {
        emailTextField.text = registerViewModel.email
        passwordTextField.text = registerViewModel.password
    }

    // MARK: - IBAction
    @IBAction private func createAccountButtonTouchUpInside(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let complete: RegisterViewModel.Completion = { (result) in
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
        registerViewModel.register(email: email, password: password, completion: complete)
    }
}
