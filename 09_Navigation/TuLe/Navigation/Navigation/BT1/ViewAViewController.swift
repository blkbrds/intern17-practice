//
//  ViewAViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

final class ViewAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View A Controller"
    }
    
    @IBAction private func nextButtonPressed(_ sender: Any) {
        let viewBViewController = ViewBViewController()
        navigationController?.pushViewController(viewBViewController, animated: true)
    }
    
}
