//
//  HomeViewController.swift
//  Tabbar
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class HomeViewController: UIViewController {

    var username: String = ""
    var viewmodel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        fetchData()
    }
    
    private func configNavigation() {
        title = Define.title
    }
    
    func fetchData() {
        viewmodel.fetchData { (done, email, password) in
            if done {
                print(email)
            } else {
                print("LỖI")
            }
        }
    }
}

extension HomeViewController {
    private struct Define {
        static var title: String = "Home"
    }
}
