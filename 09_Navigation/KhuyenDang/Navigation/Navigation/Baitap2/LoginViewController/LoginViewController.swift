//
//  LoginViewController.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Override func
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Login"
        usernameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func getUserFromPlist(withName name: String) -> [String: Any]?
    {
        var config: [String: Any]?
        if let infoPlistPath = Bundle.main.url(forResource: name, withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    config = dict
                }
            } catch {
                print(error)
            }
        }
        return config
    }
    
    //MARK: - Objc
    @objc private func handleDone() {
        guard let listUser =  getUserFromPlist(withName: "DataExercise2") else { return }
        for (key, value) in listUser {
            guard let value = value as? NSDictionary else{ return }
            guard let username = value["username"] as? String, usernameTextField.text == username,
                  let password = value["password"] as? String, passwordTextField.text == password else { return }
            let homeViewController = HomeViewController()
            homeViewController.username = username
            navigationController?.pushViewController(homeViewController, animated: true)
            break
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            handleDone()
        }
        return true
    }
}

