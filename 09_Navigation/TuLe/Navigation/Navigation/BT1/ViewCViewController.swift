//
//  ViewCViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

final class ViewCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View C ViewController"
    }
    
    @IBAction private func nextButtonPressed(_ sender: Any) {
        let viewDViewController = ViewDViewController()
        navigationController?.pushViewController(viewDViewController, animated: true)
    }
    
    @IBAction private func preButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
