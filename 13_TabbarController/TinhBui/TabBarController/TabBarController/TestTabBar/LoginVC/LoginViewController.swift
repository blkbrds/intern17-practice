//
//  LoginViewController.swift
//  TabBarController
//
//  Created by Tinh Bui T. VN.Danang on 5/31/22.
//

import UIKit

final class LoginViewController: BaseViewController {

    // MARK: - Properties
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        loginButton()
    }
    
    func loginButton() {
        let login = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(loginAction))
        navigationItem.rightBarButtonItem = login
    }

    @objc func loginAction() {
        if userNameTextField.text == "tinh123" && passWordTextField.text == "123" {
            
            // thay doi root
            let scene = UIApplication.shared.connectedScenes.first
            if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                sd.chaneScreen(type: .tabbar)
            }
        }
    }
}
