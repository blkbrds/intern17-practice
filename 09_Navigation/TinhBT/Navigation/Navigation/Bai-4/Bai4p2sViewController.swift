//
//  Bai4p2sViewController.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/10/22.
//

import UIKit

final class Bai4p2sViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Back"
    }
    
    // MARK: - IBAction
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let vc = Bai4p2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
