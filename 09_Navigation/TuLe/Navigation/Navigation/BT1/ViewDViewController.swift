//
//  ViewDViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

class ViewDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View D ViewController"
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let viewEViewController = ViewEViewController()
        navigationController?.pushViewController(viewEViewController, animated: true)
    }
    
    @IBAction func cButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bButtonPressed(_ sender: Any) {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewBViewController = navController.viewControllers[1]
            self.navigationController?.popToViewController(viewBViewController, animated: true)
        }
    }
    
    @IBAction func rootButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
