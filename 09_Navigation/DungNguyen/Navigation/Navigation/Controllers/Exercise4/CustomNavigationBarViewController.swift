//
//  CustomNavigationBarViewController.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/30/22.
//

import UIKit

final class CustomNavigationBarViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }

    // MARK: - Private methods
    private func configView(){
        title = "CustomNavigationBar"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .systemTeal
        self.view.backgroundColor = .white
        
        let leftButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.rightBarButtonItems = [searchButton, rightButton]
    }
}
