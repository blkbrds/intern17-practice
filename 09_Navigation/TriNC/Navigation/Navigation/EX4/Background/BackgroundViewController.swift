//
//  BackgroundViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class BackgroundViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColorBar()
    }
    
    // MARK: - Private Functions
    private func setBackgroundColorBar() {
        title = "Gradient NavigationBar"
        let image = UIImage(named: "ic-g")
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
}
