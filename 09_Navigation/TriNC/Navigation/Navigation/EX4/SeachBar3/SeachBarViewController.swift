//
//  SeachBarViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class SeachBarViewController: UIViewController {

    // MARK: - Properties
    private var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 280, height: 15))
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
    }
    
    // MARK: - Private Functions
    private func setupBar() {
        let leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelActions))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    // MARK: - Objc
    @objc private func cancelActions() {
        print("Cancel")
    }
}
