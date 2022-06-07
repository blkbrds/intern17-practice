//
//  EditViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

// MARK: - Protocol
protocol EditViewControllerDelegate: class {
    func didTapEditViewController(view: EditViewController, needsPeform action: EditViewController.Action)
}

final class EditViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newpasswordTextField: UITextField!
    @IBOutlet private weak var confirmpasswordTextField: UITextField!
    
    // MARK: - Properties
    var username: String?
    weak var delegate: EditViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Edit"
        
        // navigation bar
        let cancelBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelAction))
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneBarButtonItem
        navigationItem.leftBarButtonItem = cancelBarButtonItem
    }
    
    // MARK: - Objc
    @objc private func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func doneAction() {
        guard let username = usernameTextField.text else { return }
        if let delegate = delegate {
            delegate.didTapEditViewController(view: self, needsPeform: .tapDone(username: username))
        }
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extention
extension EditViewController {
    // MARK: - Define Action
    enum Action {
        case tapDone(username: String)
    }
}
