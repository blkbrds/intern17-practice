//
//  CustomeNaviBarViewController.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/30/22.
//

import UIKit

final class CustomNaviBarViewController: UIViewController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Navigation Bar Test"
        navigationController?.navigationBar.barTintColor = .cyan
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .black
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.leftBarButtonItem = searchButton
        let bookmarkButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        let settingButton = UIBarButtonItem(image: UIImage(named: "icons8-gear-50"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItems = [bookmarkButton,settingButton]
    }
}
