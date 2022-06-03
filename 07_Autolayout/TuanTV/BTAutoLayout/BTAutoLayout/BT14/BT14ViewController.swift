//
//  BT14ViewController.swift
//  BTAutoLayout
//
//  Created by Tuan Tran V. VN.Danang on 5/18/22.
//

import UIKit

final class BT14ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.addSubview(scrollView)
    }
    
    private func setupView() {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(scrollView)
    }
}
