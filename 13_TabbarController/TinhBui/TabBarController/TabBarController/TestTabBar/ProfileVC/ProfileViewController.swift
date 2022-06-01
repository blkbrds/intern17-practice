//
//  ProfileViewController.swift
//  TabBarController
//
//  Created by Tinh Bui T. VN.Danang on 5/31/22.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        logout()
    }
    
    func logout() {
        let logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
        navigationItem.rightBarButtonItem = logout
    }
    
    @objc func logoutAction() {
        //thay doi root
        let scene = UIApplication.shared.connectedScenes.first
        if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            sd.chaneScreen(type: .login)
        }
    }
}
