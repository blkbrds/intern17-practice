//
//  NavigationViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

final class NavigationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        view.subviews
            .compactMap { $0 as? UIButton }
            .forEach { configButton($0) }
    }
    
    private func configButton(_ button: UIButton) {
        button.frame.size = CGSize(width: 100, height: 50)
        button.setTitleColor( .white, for: .normal)
        button.backgroundColor = .systemTeal
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    //MARK: - IBAction private functions
    @IBAction private func goToViewController(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            navigationController?.pushViewController(AViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(LoginViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(AvatarViewController(), animated: true)
        default:
            return
        }
    }
}
