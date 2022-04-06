//
//  Exercise01ViewController.swift
//  CustomView
//
//  Created by tri.nguyen on 06/04/2022.
//

import UIKit

class Exercise01ViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        let myAvatar = Bundle.main.loadNibNamed("MyAvatarView", owner: self, options: nil)?.first as? MyAvatarView
        myAvatar?.frame = CGRect(x: 50, y: 100, width: 100, height: 125)
        view.addSubview(myAvatar!)
    }
}

extension Exercise01ViewController: MyAvatarDelegate {
    func didTap(view: MyAvatarView, name: String) {
        print("name: \(name)")
    }
}
