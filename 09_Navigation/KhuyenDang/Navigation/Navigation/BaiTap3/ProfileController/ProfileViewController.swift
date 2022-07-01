//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/30/22.
//

import UIKit
protocol ProfileViewControllerDelegate: AnyObject {
    func controller(view: ProfileViewController, username: String)
}

final class ProfileViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var imageView: UIImageView!
    
    //MARK: - Properties
    weak var delegate: ProfileViewControllerDelegate?
    var index: Int = 0
    var username = ""
    var image: UIImage?
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Private methods
    private func configUI() {
        title = "Profile"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = doneButton
        usernameTextField.text = username
        guard let image = image else { return }
        imageView.image = image
    }
    
    //MARK: - Objc
    @objc private func handleDone() {
        guard let username = usernameTextField.text else { return }
        delegate?.controller(view: self,username: username)
        navigationController?.popViewController(animated: true)
    }
}
