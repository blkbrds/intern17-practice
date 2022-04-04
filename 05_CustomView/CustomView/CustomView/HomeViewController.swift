//
//  HomeViewController.swift
//  CustomView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Functions
extension HomeViewController {
    
    private func setupUI() {
        selectExercise(with: .ex1)
    }
    
    private func selectExercise(with type: ExerciseType) {
        navigationController?.pushViewController(type.viewController, animated: true)
    }
}

// MARK: - Enum

extension HomeViewController {
    
    enum ExerciseType {
        case ex1, ex2, ex3, ex4
        
        var viewController: UIViewController {
            switch self {
            case .ex1:
                return Exercise01ViewController()
            case .ex2:
                return Exersice02ViewController()
            case .ex3:
                return Exercise03ViewController()
            case .ex4:
                return Exersice04ViewController()
            }
        }
    }
}
