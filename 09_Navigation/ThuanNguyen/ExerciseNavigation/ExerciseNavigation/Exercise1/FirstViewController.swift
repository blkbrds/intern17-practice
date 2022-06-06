//
//  FirstViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 16/05/2022.
//

import UIKit

final class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController A "
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view Did Disappear")
    }
    
    @IBAction private func push(_ sender: Any) {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
