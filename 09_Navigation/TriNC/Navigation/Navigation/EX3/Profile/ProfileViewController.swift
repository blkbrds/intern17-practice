//
//  ProfileViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

// MARK: - Protocol
protocol ProfileViewControllerDelegate: class {
    func controller(_ controller: ProfileViewController, needsPerform action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    
    // MARK: - Properties
    var username: String = ""
    var userImage: UIImage?
    var index: Int = 0
    weak var delegate: ProfileViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneActionBackHome))
        navigationItem.rightBarButtonItem = doneButton
        nameTextField.text = username
        avatarImageView.image = userImage
    }
    
    // MARK: - Objc
    @objc private func doneActionBackHome() {
        guard let delegate = delegate else { return }
        delegate.controller(self, needsPerform: .changeNameUser(username: username, index: index))
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Extention
extension ProfileViewController {
    // MARK: - Define
    enum Action {
        case changeNameUser(username: String, index: Int)
    }
}
