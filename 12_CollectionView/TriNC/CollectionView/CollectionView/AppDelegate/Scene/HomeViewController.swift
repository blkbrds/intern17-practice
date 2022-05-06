//
//  HomeViewController.swift
//  CollectionView
//
//  Created by tri.nguyen on 02/05/2022.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Functions
extension HomeViewController {
    
    private func setupUI() {
        selectExercise(with: .ex4)
    }
    
    private func selectExercise(with type: ExerciseType) {
        navigationController?.pushViewController(type.viewController, animated: true)
    }
}

// MARK: - Enums
extension HomeViewController {
    enum ExerciseType {
        case ex1, ex2, ex3, ex4
        
        var viewController: UIViewController {
            switch self {
            case .ex1:
                return Ex1ViewController()
            case .ex2:
                return Ex2ViewController()
            case .ex3:
                return Ex3ViewController()
            case .ex4:
                return Ex4ViewController()
            }
        }
    }
}
