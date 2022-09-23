//
//  FavoriteViewController.swift
//  Tabbar
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    private func configNavigation() {
        title = Define.title
    }
}

extension FavoriteViewController {
    private struct Define {
        static var title: String = "Favorite"
    }
}
