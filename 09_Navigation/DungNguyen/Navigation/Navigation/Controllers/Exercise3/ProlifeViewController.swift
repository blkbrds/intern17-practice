//
//  ProlifeViewController.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/30/22.
//

import UIKit

// MARK: - Protocols
protocol ProlifeViewControllerDelegate: AnyObject {
    func controller(viewController: ProlifeViewController, username: String)
}

final class ProlifeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    // MARK: - MARK: - Properties
    var name:String = ""
    var avatar: UIImage?
    var delegate: ProlifeViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }

    // MARK: - Private methods
    private func configView(){
        title = "Profile"
        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton
        nameTextField.text = "\(name)"
        avatarImageView.image = avatar
        
    }
    
    // MARK: - Private methods
    @objc private func doneAction() {
        guard let username = nameTextField.text else { return }
        delegate?.controller(viewController: self, username: username)
        navigationController?.popViewController(animated: true)
    }
}
