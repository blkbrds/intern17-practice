//
//  LoginViewController.swift
//  TabBarController
//
//  Created by Tinh Bui T. VN.Danang on 5/31/22.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    // MARK: - Properties
    let loginModel = LoginviewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        loginButton()
    }
    
    // MARK: - Private functions
    private func loginButton() {
        let login = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(loginAction))
        navigationItem.rightBarButtonItem = login
    }
    
    // MARK: - Objc functions
    @objc func loginAction() {
        if loginModel.login(username: userNameTextField.text ?? "", passwork: passWordTextField.text ?? "" ) == true {
            let scene = UIApplication.shared.connectedScenes.first
            if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                sd.chaneScreen(type: .tabbar)
            }
        }
    }
}
