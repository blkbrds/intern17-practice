//
//  LoginViewController.swift
//  BTNavigation
//
//  Created by Tuan Tran V. VN.Danang on 5/23/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: -IBOutlets
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func setupView() {
        errorLabel.isHidden = true
        title = "Login"
        navigationController?.navigationBar.backgroundColor = .orange
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func doneTapped() {
        let result = validateLogin()
        switch result {
        case .success(_):
            errorLabel.isHidden = true
            let vc = HomeViewController()
            vc.loginUsername = userNameTextField.text!
            navigationController?.pushViewController(vc, animated: true)
        case .fail(let value):
            errorLabel.isHidden = false
            errorLabel.text = value
        }
    }
    
    private func validateLogin() -> Result {
        let username = userNameTextField.text!
        let password = passwordTextField.text!
        do {
            let result = try DataManager.shared().read()
            for (_, value) in result {
                if username == value[0] {
                    if password == value[1] {
                        return .success("Success")
                    } else {
                        return .fail("Please check password")
                    }
                }
            }
        } catch {
            print(error)
        }
        return .fail("anonymous")
    }
}

enum Result {
    case success(_: String)
    case fail(_: String)
}
