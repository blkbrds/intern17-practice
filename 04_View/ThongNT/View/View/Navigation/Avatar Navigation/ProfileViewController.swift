//
//  ProfileViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/8/22.
//

import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    func changeName(on view: ProfileViewController, with userInfo: UserInfo, tag: Int)
}

final class ProfileViewController: UIViewController {
    
    //MARK: - IBOutlet private variables
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var userNameTextField: UITextField!
    
    private var userInfo: UserInfo = UserInfo(username: "", userImage: "")
    private var tag: Int = 0
    weak var delegate: ProfileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(user: UserInfo, tag: Int) {
        self.userInfo = user
        self.tag = tag
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    private func setupUI() {
        configBarItem()
        title = "Profile"
        userImageView.image = UIImage(named: userInfo.userImage)
        userNameTextField.text = userInfo.username
        userNameTextField.font = .boldSystemFont(ofSize: 30)
    }
    
    private func configBarItem() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(updateUserName))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func updateUserName() {
        guard let delegate = delegate,
              let newName = userNameTextField.text else { return }
        userInfo.username = newName
        delegate.changeName(on: self, with: userInfo, tag: tag)
        navigationController?.popViewController(animated: true)
    }
}
