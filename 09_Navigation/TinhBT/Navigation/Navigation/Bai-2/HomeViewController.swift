//
//  HomeViewController.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/10/22.
//

import UIKit

// MARK: - HomeViewDelegate
protocol HomeViewDelegate: class {
    func view(view: HomeViewController, needPerform action: HomeViewController.Action )
}

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var vc = EditViewController()
    var username = ""
    weak var delegate: HomeViewDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "home"
        createButton()
        nameLabel.text = "\(username)!"
        vc.delegate = self
    }
    
    // MARK: - Private functions
    private func createButton() {
        let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        editButton.addTarget(self, action: #selector(edit), for: .touchUpInside)
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.blue, for: .normal)
        let rightBarButton = UIBarButtonItem(customView: editButton)
        navigationItem.rightBarButtonItem = rightBarButton
        
        let logoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.blue, for: .normal)
        let leftBarButton = UIBarButtonItem(customView: logoutButton)
        navigationItem.leftBarButtonItem = leftBarButton
    }

    // MARK: - Objc functions
    @objc private func edit() {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func logout() {
        delegate?.view(view: self, needPerform: .logout)
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - HomeViewController
extension HomeViewController {
    enum Action {
        case logout
    }
}

// MARK: - EditViewDelegate
extension HomeViewController: EditViewDelegate {
        func view(view: EditViewController, needPerform action: EditViewController.Action) {
        switch action {
        case .sendData(value: let value):
            nameLabel.text = value
        }
    }
}
