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
        inCorrect()
        view.backgroundColor = .lightGray
    }
    
    private func changeColorAndTintColorBar() {
        // tintcolor
        navigationController?.navigationBar.tintColor = .white
        // titlecolor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // MARK: - NaviBar
    private func inCorrect() {
        title = "News Feed"
        // navigation bar
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(leftAction))
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    // MARK: - Objc
    @objc private func leftAction() {}
    @objc private func rightAction() {}
}
