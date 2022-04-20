//
//  NewsFeedViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class NewsFeedViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColorAndTintColorBar()
        navigationBar()
    }
    
    // MARK: Private Functions
    private func changeColorAndTintColorBar() {
        self.navigationController?.navigationBar.backgroundColor = .cyan
        self.navigationController?.navigationBar.tintColor = .brown
    }
    
    // MARK: - NaviBar
    private func navigationBar() {
        title = "News Feed"
        let leftTintColorBarItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftAction))
        let rightTintColorBarItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightAction))
        
        navigationItem.leftBarButtonItem = leftTintColorBarItem
        navigationItem.rightBarButtonItem = rightTintColorBarItem
    }
    
    // Action
    @objc private func leftAction() {
        print("action")
    }
    
    @objc private func rightAction() {
        print("action")
    }

}
