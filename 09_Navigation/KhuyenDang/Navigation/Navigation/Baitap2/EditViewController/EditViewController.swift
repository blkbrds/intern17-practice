//
//  EditViewController.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

protocol EditViewControllerDelegate: AnyObject {
    func controller(view: EditViewController, username: String)
}

final class EditViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    
    //MARK: - Properties
    weak var delegate: EditViewControllerDelegate?
    var username = ""
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Private method
    private func configUI() {
        title = "Edit"
        usernameTextField.text = "\(username)"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = doneButton
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    //MARK: Objcs
    @objc private func handleDone(){
        guard let username = usernameTextField.text else { return }
        delegate?.controller(view: self,username: username)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleCancel(){         
        navigationController?.popViewController(animated: true)
    }
}
