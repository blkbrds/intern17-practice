//
//  ViewCViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

final class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View C ViewController"
    }
    
    @IBAction private func nextButtonTouchUpinside(_ sender: Any) {
        let viewDViewController = DViewController()
        navigationController?.pushViewController(viewDViewController, animated: true)
    }
    
    @IBAction private func preButtonTouchUpinside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootButtonTouchUpinside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
