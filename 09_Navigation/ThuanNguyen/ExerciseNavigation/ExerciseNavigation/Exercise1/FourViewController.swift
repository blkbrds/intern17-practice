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
        guard let navi = navigationController else { return }
        let vc = navi.viewControllers[1]
        navi.popToViewController(vc, animated: true)
    }
    
    @IBAction private func preRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
