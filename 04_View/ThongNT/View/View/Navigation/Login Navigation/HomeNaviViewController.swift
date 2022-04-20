//
//  HomeNaviViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/7/22.
//

import UIKit

final class HomeNaviViewController: UIViewController {
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    private var user: User
    private var editVC = EditViewController(user: User(userName: "", password: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
        editVC = EditViewController(user: user)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    private func setupUI() {
        title = "Home"
        configBarItem()
        configLabel()
        editVC.delegate = self
    }
    
    private func configLabel() {
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = .boldSystemFont(ofSize: 20)
        welcomeLabel.text = "Welcome \n \(user.userName)"
    }
    
    private func configBarItem() {
        // Cancel button push back
        let cancelButton = UIBarButtonItem()
        cancelButton.title = "Cancel"
        navigationItem.backBarButtonItem = cancelButton
        
        // Edit button
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(goToEditController))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func goToEditController() {
        navigationController?.pushViewController(editVC, animated: true)
    }
}

extension HomeNaviViewController: EditViewControllerDelegate {
    func sendInform(with view: EditViewController, message: String) {
        welcomeLabel.text = "Welcome \n \(user.userName) \n \(message)"
    }
}
