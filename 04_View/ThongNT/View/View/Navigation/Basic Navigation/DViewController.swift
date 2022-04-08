//
//  DViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/7/22.
//

import UIKit

final class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        title = "ViewController D"
        view.subviews
            .compactMap { $0 as? UIButton }
            .forEach { configButton($0) }
        
    }
    
    private func configButton(_ button: UIButton) {
        button.setTitleColor( .white, for: .normal)
        button.backgroundColor = .systemTeal
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    @IBAction private func buttonTouchUPInside(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            navigationController?.pushViewController(EViewController(), animated: true)
        case 1:
            // Go to ViewController B
            guard let bVC = navigationController?.viewControllers.first(where: { $0.isKind(of: BViewController.self) }) else { return }
            navigationController?.popToViewController(bVC, animated: true)
        case 2:
            // Go to ViewController C
            navigationController?.popViewController(animated: true)
        case 3:
            // Go to ViewController A
           guard let aVC = navigationController?.viewControllers.first(where: { $0.isKind(of: AViewController.self)}) else { return }
            navigationController?.popToViewController(aVC, animated: true)
        default:
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
