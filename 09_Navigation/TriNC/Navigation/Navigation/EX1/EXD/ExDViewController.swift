//
//  ExDViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class ExDViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController D"
    }
    
    // MARK: - IBActions
    @IBAction private func nextButtonTouchUpinside(_ sender: Any) {
        let vc = ExEViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        for controller in (navigationController?.viewControllers ?? [UINavigationController()]) as Array {
            if controller.isKind(of: ExCViewController.self) {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        for controller in (navigationController?.viewControllers ?? [UINavigationController()]) as Array {
            if controller.isKind(of: ExBViewController.self) {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
