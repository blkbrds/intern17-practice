//
//  HomeViewController.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet private weak var usernameLabel: UILabel!
    
    //MARK: - Properties
    var username = ""
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Private method
    private func configUI() {
        title = "Home"
        usernameLabel.text = "Welcome \(username)"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEdit))
        navigationItem.rightBarButtonItem = editButton
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem = logoutButton
    }
    
    //MARK: - objc methods
    @objc private func handleLogout() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleEdit() {
        let editViewController = EditViewController()
        editViewController.delegate = self
        editViewController.username = username
        navigationController?.pushViewController(editViewController, animated: true)
    }
}

//MARK: - Extension
extension HomeViewController: EditViewControllerDelegate {
    func controller(view: EditViewController, username: String) {
        usernameLabel.text = username
    }
}

