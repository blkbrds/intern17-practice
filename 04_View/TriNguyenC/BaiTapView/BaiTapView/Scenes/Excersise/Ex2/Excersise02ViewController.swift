//
//  Excersise02ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 30/03/2022.
//

import UIKit

final class Excersise02ViewController: UIViewController {

    // MARK: - Properties
    private let names: [String] = ["iOS", "FE", "BE", "MCLN", "Fluter", "Android", "DeepLN", "QA", "BA"]
    private let images: [String] = ["ic-user", "ic-user", "ic-user", "ic-user", "ic-user", "ic-user", "ic-user", "ic-user", "ic-user"]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        // Title
        title = "Exercise02"
        navigationController?.isNavigationBarHidden = true
//
        let screenWidth = UIScreen.main.bounds.width
        guard let avatarView = Bundle.main.loadNibNamed("Exercise01View", owner: self, options: nil)?.first as? Exercis01View else { return }
        avatarView.frame = CGRect(x: 0, y: 150, width: screenWidth / 3, height: 125)
        avatarView.name = names[0]
        avatarView.avatar = images[0]
        view.addSubview(avatarView)
    }
    
}
