//
//  ExEViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 19/04/2022.
//

import UIKit

final class ExEViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
    }
    
    // MARK: - IBActions
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
    
    @IBAction private func dButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
