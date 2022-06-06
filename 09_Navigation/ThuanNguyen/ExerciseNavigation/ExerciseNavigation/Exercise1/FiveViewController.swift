//
//  FiveViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 16/05/2022.
//

import UIKit

final class FiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller E"
    }
    
    @IBAction private func popControllerC(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popControllerB(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popControllerD(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func popRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
