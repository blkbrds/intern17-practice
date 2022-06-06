//
//  SecondViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 16/05/2022.
//

import UIKit

final class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
    }
    
    @IBAction private func next(_ sender: Any) {
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func pre(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
