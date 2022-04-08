//
//  BViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/7/22.
//

import UIKit

final class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        title = "ViewController B"
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
            navigationController?.pushViewController(CViewController(), animated: true)
        case 1:
            navigationController?.popViewController(animated: true)
        default:
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
