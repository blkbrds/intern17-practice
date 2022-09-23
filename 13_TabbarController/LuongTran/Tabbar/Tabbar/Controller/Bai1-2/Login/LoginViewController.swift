//
//  LoginViewController.swift
//  Tabbar
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class LoginViewController: UIViewController, Coordinating {
    var coodinator: Coordinator?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel = LoginViewModel(email: "", password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        updateView()
    }
    
    private func configNavigation() {
        title = Define.title
    }
    
    private func updateView() {
        usernameTextField.text = viewModel.email
        passwordTextField.text = viewModel.password
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        let email = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // tao gia tri cho closure
        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
                guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
                delegate.changeRootToHome()
                print("ĐĂNG NHẬP THÀNH CÔNG")
                self.updateView()
            case .failure(let isError, let errorMsg):
                if isError {
                    print("ĐĂNG NHẬP THẤT BẠI")
                    print(errorMsg)
                }
            }
        }
        
        // goi ham
        viewModel.login(email: email, password: password, completion: complete)
    }
    
    @IBAction func registerButtonTouchUpInside(_ sender: Any) {
        coodinator?.eventOccurred(with: .accessRegister)
    }
    
    @IBAction func forgotButtonTouchUpInside(_ sender: Any) {
        let forgotVC = ForgotPasswordViewController()
        navigationController?.pushViewController(forgotVC, animated: true)
    }
}

extension LoginViewController {
    private struct Define {
        static var title: String = "Login"
    }
}
