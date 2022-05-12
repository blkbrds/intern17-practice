//
//  HomeViewController.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/10/22.
//

import UIKit

protocol HomeViewDelegate: class {
    func view(view: HomeViewController, needPerform action: HomeViewController.Action )
}

final class HomeViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    
    var vc = EditViewController()
    
    var username = ""
    weak var delegate: HomeViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        title = "home"
    
        createButton()
        nameLabel.text = "\(username)!"
        vc.delegate = self
    }
    
    func createButton() {
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

    @objc func edit() {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logout() {
        delegate?.view(view: self, needPerform: .logout)
        navigationController?.popToRootViewController(animated: true)
    }
}

extension HomeViewController {
    
    enum Action {
        case logout
    }
}

extension HomeViewController: EditViewDelegate {
    
    func view(view: EditViewController, needPerform action: EditViewController.Action) {
        switch action {
        
        case .sendData(value: let value):
            nameLabel.text = value
        }
    }
}
