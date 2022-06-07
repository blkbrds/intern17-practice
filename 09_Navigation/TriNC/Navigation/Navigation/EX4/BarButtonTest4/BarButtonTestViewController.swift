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
        let nextBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(changeEditAction))
        navigationItem.rightBarButtonItem = nextBarButtonItem
    }
    
    // MARK: - Objc
    @objc private func changeEditAction() {
        print("Next Next Next")
    }
}
