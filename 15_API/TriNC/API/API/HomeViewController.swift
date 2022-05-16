//
//  HomeViewController.swift
//  API
//
//  Created by tri.nguyen on 14/05/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Enum
    enum ExerciseType {
        case ex1, ex2
        
        var viewController: UIViewController {
            switch self {
            case .ex1:
                return Ex1ViewController()
            case .ex2:
                return Ex2ViewController()
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
