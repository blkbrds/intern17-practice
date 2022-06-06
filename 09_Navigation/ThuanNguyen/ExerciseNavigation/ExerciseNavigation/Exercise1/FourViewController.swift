//
//  FourViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 16/05/2022.
//

import UIKit

final class FourViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller D"
    }
    
    @IBAction private func next(_ sender: Any) {
        let vc = FiveViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func preControllerC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func preControllerB(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
        
    }
    
    @IBAction private func preRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
