//
//  LoginViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 16/05/2022.
//

import UIKit

class LoginViewController: UIViewController {
    var users = [[String]]()

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        setupUI()
        getData()
    }
    
    private func setupUI() {
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func rightAction() {
        for i in 0..<users.count {
            if usernameTextField.text == users[i].first && passwordTextField.text == users[i].last {
                let vc = HomeViewController()
                if let user = users[i].first {
                    vc.username = user
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    private func getData() {
        guard let path = Bundle.main.path(forResource: "UserList", ofType: "plist") else {return}
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [[String]] else {return}
        users = plist
    }
}
