//
//  ProfileViewController.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    func updateProfile(needPerform action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {

    enum Action {
        case updateUsername(userName: String)
    }
    
    weak var delegate: ProfileViewControllerDelegate?
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var userText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configNavigation()
        configUI()
    }
    
    private func configNavigation() {
        title = Define.titleBar
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configUI() {
        nameTextField.text = userText
    }

    @objc private func doneButtonTouchUpInSide() {
        guard let newName = nameTextField.text else { return }
        delegate?.updateProfile(needPerform: .updateUsername(userName: newName))
        navigationController?.popViewController(animated: true)
    }
    
}

extension ProfileViewController {
    private struct Define {
        static let titleBar = "Profile"
    }
}
