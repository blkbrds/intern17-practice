//
//  ViewAViewController.swift
//  Navigation
//
//  Created by tu.le2 on 29/06/2022.
//

import UIKit

final class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View A Controller"
    }
    
    @IBAction private func nextButtonTouchUpinside(_ sender: Any) {
        let viewBViewController = BViewController()
        navigationController?.pushViewController(viewBViewController, animated: true)
    }
    
}
