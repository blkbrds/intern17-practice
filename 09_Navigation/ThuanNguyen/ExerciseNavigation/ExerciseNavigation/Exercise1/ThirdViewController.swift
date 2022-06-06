//
//  ThirdViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 16/05/2022.
//

import UIKit

final class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller C"
        
    }
    
    @IBAction private func next(_ sender: Any) {
        let vc = FourViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func pre(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func root(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
