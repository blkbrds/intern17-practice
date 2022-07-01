//
//  ViewEViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

final class ViewEViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View E ViewController"
    }
    
    @IBAction private func cButtonPressed(_ sender: Any) {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewCViewController = navController.viewControllers[2]
            self.navigationController?.popToViewController(viewCViewController, animated: true)
        }
    }
    
    @IBAction private func bButtonPressed(_ sender: Any) {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewBViewController = navController.viewControllers[1]
            self.navigationController?.popToViewController(viewBViewController, animated: true)
        }
    }
    
    @IBAction private func dButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
