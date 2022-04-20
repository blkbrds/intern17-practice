//
//  BarButtonTestViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class BarButtonTestViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
    }
    
    // MARK: - Private Function
    private func setupBar() {
        title = "Bar Button Test"
        
        // NavigationItem
        let buttonTestBarItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(changeEditAction))
        navigationItem.rightBarButtonItem = buttonTestBarItem
        
        let backgroundImage = UIImage(named: "ic-gradient")
        navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
    }
    
    // MARK: - Objc
    @objc private func changeEditAction() {}
}
