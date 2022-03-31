//
//  HomeViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 30/03/2022.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Functions
extension HomeViewController {

    private func setupUI() {
        // Set bai tap mac dinh
        selectExcersise(with: .ex3)
    }

    private func selectExcersise(with type: ExcersiseType) {
        navigationController?.pushViewController(type.viewController, animated: true)
    }
}

// MARK: - Enums
extension HomeViewController {

    enum ExcersiseType {
        case ex1, ex2, ex3
    
        var viewController: UIViewController {
            switch self {
            case .ex1:
                return Excersise01ViewController()
            case .ex2:
                return Excersise02ViewController()
            case .ex3:
                return Exercise03ViewController()
            }
        }
    }
}
