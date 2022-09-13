//
//  EditB2ViewController.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

protocol EditViewControllerDelegate {
    func actionDelegate(needPerform action: EditB2ViewController.Action)
}

final class EditB2ViewController: UIViewController {
    
    enum Action {
        case changeUsername(name: String)
    }
    
    var delegate: EditViewControllerDelegate?

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPassTextField: UITextField!
    @IBOutlet private weak var confirmPassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    private func configNavigation() {
        title = Define.titleBar
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTouchUpInSide))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc private func doneButtonTouchUpInSide() {
        if let userName = usernameTextField.text, userName != "",
           let newPass = newPassTextField.text, newPass != "",
           let confirmPass = confirmPassTextField.text, confirmPass != ""{
            delegate?.actionDelegate(needPerform:.changeUsername(name: userName))
            navigationController?.popViewController(animated: true)
        }
    }
    @objc private func cancelButtonTouchUpInSide() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension EditB2ViewController {
    private struct Define {
        static let titleBar: String = "Home"
    }
}
