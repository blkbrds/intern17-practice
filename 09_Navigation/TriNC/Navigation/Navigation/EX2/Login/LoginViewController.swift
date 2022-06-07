//
//  LoginViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var notificationLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
  
    // MARK: - Private Functions
    private func setupUI() {
        title = "Login"
        // delegate
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        // Navigation Bar
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneBarButtonItem
    }
        

    // MARK: - Objc
    @objc private func doneAction() {
        guard let username = usernameTextField.text, let password = passwordTextField.text, !username.isEmpty, !password.isEmpty else {
            notificationLabel.text = "Please enter data"
            return
        }
    
        if DataManager.checkData(username: username, password: password) {
            let vc = HomeViewController()
            vc.delegate = self
            vc.username = username
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            notificationLabel.text = "Wrong username or password"
        }
    }

    // MARK: - Touch Event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - Extention UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        return true
    }
}

// MARK: - Implement HomeProtocol
extension LoginViewController: HomeViewControllerDelegate {
    func homeController(view: HomeViewController, needsPerform action: HomeViewController.Action) {
        switch action {
        case .logout:
            usernameTextField.text = ""
            passwordTextField.text = ""
        }
    }
}

