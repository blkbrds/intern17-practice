//
//  HomeViewController.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/29/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - MARK: - Properties
    var username: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Private methods
    private func configView(){
        title = "Home"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
        nameLabel.text = "\(username)"
    }
    
    // MARK: - Objcs
    @objc private func logoutAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func editAction() {
        let vc = EditViewController()
        vc.username = username
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions
extension HomeViewController: EditViewControllerDelegate {
    func controller(viewController: EditViewController, username: String) {
        nameLabel.text = username
    }
}

