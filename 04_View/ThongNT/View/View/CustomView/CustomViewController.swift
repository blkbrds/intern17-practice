//
//  CustomViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

final class CustomViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavibar()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        view.subviews
            .compactMap { $0 as? UIButton }
            .forEach { configButton($0) }
        
        self.title = "Custom View"
    }
    
    private func configButton(_ button: UIButton) {
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.frame.size = CGSize(width: 200, height: 80)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
    }
    
    private func setupNavibar() {
        let drawing = UIBarButtonItem(title: "DRAWING",
                                      style: .plain,
                                      target: self,
                                      action: #selector(pushToDrawing))
        navigationItem.rightBarButtonItem = drawing
    }
    
    @objc private func pushToDrawing() {
        navigationController?.pushViewController(DrawingViewController(), animated: true)
    }
    
    //MARK: - IBAction private functions
    @IBAction private func handleNavigation(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            navigationController?.pushViewController(AvatarViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(MySliderViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(BadgeNumberViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(DatePickerViewController(), animated: true)
        default:
            return
        }
    }
}
