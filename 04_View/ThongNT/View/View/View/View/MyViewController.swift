//
//  MyViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

final class MyViewController: UIViewController {
    
    @IBOutlet var exerciseButtonsCollection: [UIButton]!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.subviews
            .compactMap { $0 as? UIButton }
            .forEach { configButton($0) }
    }
    
    private func configButton(_ button: UIButton) {
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.frame.size = CGSize(width: 150, height: 90)
    }
    
    @IBAction func buttonTouchUpInSide(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            navigationController?.pushViewController(HomeViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(LoginViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(ColorViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(SliderViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(MonkeyViewController(), animated: true)
        default:
            return
        }
    }
}
