//
//  MainCoodinator.swift
//  Tabbar
//
//  Created by luong.tran on 22/09/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var childCoordinators: [Coordinator]? = nil

    
    func eventOccurred(with type: Event) {
        switch type {
        case .accessRegister:
            var registerVC: UIViewController & Coordinating = RegisterViewController()
            registerVC.coodinator = self
            navigationController?.pushViewController(registerVC, animated: true)
        }
    }
    
    func start() {
        var loginVC: UIViewController & Coordinating = LoginViewController()
        loginVC.coodinator = self
        navigationController?.setViewControllers([loginVC], animated: true )
    }
}
