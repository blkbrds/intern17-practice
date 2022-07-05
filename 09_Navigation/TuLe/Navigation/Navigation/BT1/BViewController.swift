//
//  ViewBViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

final class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View B Controller"
    }
    
    @IBAction private func nextButtonTouchUpinside(_ sender: Any) {
        let viewCViewController = CViewController()
        navigationController?.pushViewController(viewCViewController, animated: true)
    }
    
    @IBAction private func preButtonTouchUpinside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
