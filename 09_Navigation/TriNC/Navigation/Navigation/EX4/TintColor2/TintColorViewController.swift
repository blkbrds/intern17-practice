//
//  TintColorViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class TintColorViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
    }

    // MARK: Private Functions
    private func setupBar() {
        changeColorAndTintColorBar()
        navigationBarItem()
        view.backgroundColor = .lightGray
    }
    
    private func changeColorAndTintColorBar() {
        // title navi
        self.navigationController?.navigationBar.backgroundColor = .cyan
        // tintcolor
        self.navigationController?.navigationBar.tintColor = .blue
        // titlecolor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // MARK: - NaviBar
    private func navigationBarItem() {
        title = "News Feed"
        // navigation bar
        let leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftAction))
        let rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    // MARK: - Objc
    @objc private func leftAction() {}
    @objc private func rightAction() {}
}
