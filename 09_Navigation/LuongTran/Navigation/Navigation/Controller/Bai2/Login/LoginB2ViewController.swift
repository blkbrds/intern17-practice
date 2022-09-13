//
//  LoginB2ViewController.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

final class LoginB2ViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        resetTextField()
    }
    
    private func configNavigation() {
        title = Define.titleNavigation
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func resetTextField() {
        passwordTextField.text = ""
        usernameTextField.text = ""
    }
    
    @objc private func doneButtonTouchUpInSide() {
        if let userName = usernameTextField.text, userName != "",
           let passWord = passwordTextField.text, passWord != "" {
            let homeB2VC = HomeB2ViewController()
            homeB2VC.username = userName
            navigationController?.pushViewController(homeB2VC, animated: true)
        }
    }

}

extension LoginB2ViewController {
    private struct Define {
        static let titleNavigation: String = "Login"
    }
}
