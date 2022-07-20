//
//  ViewDViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

final class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View D ViewController"
    }
    
    @IBAction private func nextButtonTouchUpinside(_ sender: Any) {
        let viewEViewController = EViewController()
        navigationController?.pushViewController(viewEViewController, animated: true)
    }
    
    @IBAction private func cButtonTouchUpinside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func bButtonTouchUpinside(_ sender: Any) {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewBViewController = navController.viewControllers[1]
            self.navigationController?.popToViewController(viewBViewController, animated: true)
        }
    }
    
    @IBAction private func rootButtonTouchUpinside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
