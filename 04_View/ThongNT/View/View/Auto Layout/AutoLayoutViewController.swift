//
//  AutoLayoutViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/6/22.
//

import UIKit

final class AutoLayoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        view.subviews
            .compactMap { $0 as? UIButton}
            .forEach { configButton($0) }
    }
    
    private func configButton(_ button: UIButton) {
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.frame.size = CGSize(width: 150, height: 60)
        button.setTitleColor(.white, for: .normal)
    }
    
    @IBAction private func baiTapTouchUpInSide(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            navigationController?.pushViewController(SquareViewController(),
                                                     animated: true)
        case 1:
            navigationController?.pushViewController(SquaresViewController(),
                                                     animated: true)
        case 2:
            navigationController?.pushViewController(CatAutoLayoutViewController(),
                                                     animated: true)
        case 3:
            navigationController?.pushViewController(CatAutoLayoutViewController(),
                                                         animated: true)
        default:
            return
        }
    }
}
