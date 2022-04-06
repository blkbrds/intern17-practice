//
//  CustomViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

final class CustomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavibar()
    }
    
    private func setupNavibar() {
        let drawing = UIBarButtonItem(title: "DRAWING",
                                      style: .plain,
                                      target: self,
                                      action: #selector(pushToDrawing))
        navigationItem.rightBarButtonItem = drawing
    }
    
    @objc private func pushToDrawing() {
        navigationController?.pushViewController(DrawingViewController(), animated: true)
    }
}
