//
//  CustomNaviViewController.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

final class CustomNaviViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    private func configNavigation() {
        title = Define.titleBar
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let searchButton  = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        searchButton.tintColor = .white
        navigationItem.leftBarButtonItem = searchButton
        let bookmarkButton  = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        bookmarkButton.tintColor = .white
        navigationItem.rightBarButtonItem = bookmarkButton
        navigationController?.navigationBar.backgroundColor = .blue
    }

}


extension CustomNaviViewController {
    private struct Define {
        static var titleBar: String = "News Feed"
    }
}
