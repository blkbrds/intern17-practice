//
//  ViewBViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

class ViewBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View B Controller"
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let viewCViewController = ViewCViewController()
        navigationController?.pushViewController(viewCViewController, animated: true)
    }
    
    @IBAction func preButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
