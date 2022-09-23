//
//  RegisterViewController.swift
//  Tabbar
//
//  Created by luong.tran on 22/09/2022.
//

import UIKit

final class RegisterViewController: UIViewController, Coordinating {
    var coodinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    private func configNavigation() {
        title = Define.title
    }
    
    @IBAction private func registerButtonTouchUpInside(_ sender: Any) {
        UserDefaults.standard.set("luong", forKey: "username")
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        delegate.changeRootToHome()
    }
}

extension RegisterViewController {
    private struct Define {
        static var title: String = "Register"
    }
}
