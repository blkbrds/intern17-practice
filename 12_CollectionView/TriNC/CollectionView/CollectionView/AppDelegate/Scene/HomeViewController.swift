//
//  HomeViewController.swift
//  CollectionView
//
//  Created by tri.nguyen on 02/05/2022.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Enum
    enum ExerciseType {
        case ex1, ex2, ex3, ex4, ex5
        
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
            case .ex5:
                return Ex5ViewController()
            }
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        selectExercise(with: .ex1)
    }
    
    private func selectExercise(with type: ExerciseType) {
        navigationController?.pushViewController(type.viewController, animated: true)
    }
}
