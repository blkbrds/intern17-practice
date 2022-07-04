//
//  BadgeNumberViewController.swift
//  CustomView_bai1
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/20/22.
//

import UIKit

final class BadgeNumberViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        let badgeNumberView = Bundle.main.loadNibNamed("BadgeNumberView", owner: self, options: nil)?.first as! BadgeNumberView
        badgeNumberView.frame = CGRect(x: 100, y: 150, width: 100, height: 20)
        badgeNumberView.number = 10
        badgeNumberView.name = "Email"
        badgeNumberView.badgeType = .topCenter
        badgeNumberView.configView()
        self.view.addSubview(badgeNumberView)
        
        let friendButton = Bundle.main.loadNibNamed("BadgeNumberView", owner: self, options: nil)?.first as! BadgeNumberView
        friendButton.frame = CGRect(x: 100, y: 250, width: 100, height: 20)
        friendButton.number = 999
        friendButton.name = "Friend"
        friendButton.badgeType = .topLeft
        friendButton.backgroundButtonColor = .yellow
        friendButton.configView()
        self.view.addSubview(friendButton)
        
        let photodButton = Bundle.main.loadNibNamed("BadgeNumberView", owner: self, options: nil)?.first as! BadgeNumberView
        photodButton.frame = CGRect(x: 100, y: 350, width: 100, height: 20)
        photodButton.number = 2
        photodButton.name = "Photos"
        photodButton.badgeType = .topRight
        photodButton.backgroundButtonColor = .green
        photodButton.configView()
        self.view.addSubview(photodButton)
    }
}
