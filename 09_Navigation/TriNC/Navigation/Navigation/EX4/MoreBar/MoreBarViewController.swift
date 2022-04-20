//
//  MoreBarViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class MoreBarViewController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarItems()
    }
    
    // MARK: - Private Functions
    private func setupBarItems() {
        title = "MoreBarItems"
        view.backgroundColor = .lightGray
        // LeftBar
        let playBarButtonOneItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playActionOne))
        let playBarButtonTwoItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playActionTwo))
        
        // RightBar
        let trashBarButtonOneItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashActionOne))
        let trashBarButtonTwoItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashActionTwo))
        
        navigationItem.leftBarButtonItems = [playBarButtonOneItem, playBarButtonTwoItem]
        navigationItem.rightBarButtonItems = [trashBarButtonOneItem, trashBarButtonTwoItem]
    }
    
    // MARK: - Objc
    @objc private func playActionOne() {}
    @objc private func playActionTwo() {}
    @objc private func trashActionOne() {}
    @objc private func trashActionTwo() {}
}
