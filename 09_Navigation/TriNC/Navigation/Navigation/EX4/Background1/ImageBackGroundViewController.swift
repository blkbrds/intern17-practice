//
//  ImageBackGroundViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class ImageBackGroundViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
    }
    
    // MARK: - Private Functions
    private func setupBar() {
        title = "Gradient NavigationBar"
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "ic-gradient"), for: .default)
    }
}
