//
//  LoginViewController.swift
//  TabBarController
//
//  Created by Tinh Bui T. VN.Danang on 5/31/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var hvc = HomeViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    func createButton() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneButton
    }

    @objc func done() {
          if userNameTextField.text == "tinh123" && passwordTextField.text == "123" {
              navigationController?.pushViewController(hvc, animated: true)
              hvc.username = userNameTextField.text ?? ""
          }
      }
}

