//
//  BaseViewController.swift
//  TabBar
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/12/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeRoot(type: SceneDelegate.TypeScreen) {
        let scene = UIApplication.shared.connectedScenes.first
        if let sceneDelegate : SceneDelegate = (scene?.delegate as? SceneDelegate) {
            sceneDelegate.changeScreen(type: type)
        }
    }
}
