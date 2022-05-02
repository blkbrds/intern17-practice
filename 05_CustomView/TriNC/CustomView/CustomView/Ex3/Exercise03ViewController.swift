//
//  Exercise03ViewController.swift
//  CustomView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit


final class Exercise03ViewController: UIViewController {

    // MARK: - Properties
    private let badgeNumberButtonOne = BadButtonView()
    private let badgeNumberButtonTwo = BadButtonView()
    private let badgeNumberButtonThree = BadButtonView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Exercise03"
        badgeNumberButtonOne.frame = CGRect(x: 100, y: 144, width: 150, height: 80)
        badgeNumberButtonOne.isShowBadgeNumber = true
        badgeNumberButtonOne.badgeNumber = 88
        badgeNumberButtonOne.selectPosition = .topRight
        badgeNumberButtonOne.layer.cornerRadius = 12
        badgeNumberButtonOne.backgroundColor = .orange
        badgeNumberButtonOne.setTitle("Instagram", for: .normal)
        view.addSubview(badgeNumberButtonOne)
        
        badgeNumberButtonTwo.frame = CGRect(x: 100, y: 254, width: 150, height: 80)
        badgeNumberButtonTwo.isShowBadgeNumber = true
        badgeNumberButtonTwo.badgeNumber = 100
        badgeNumberButtonTwo.selectPosition = .topLeft
        badgeNumberButtonTwo.layer.cornerRadius = 12
        badgeNumberButtonTwo.backgroundColor = .blue
        badgeNumberButtonTwo.setTitle("FaceBook", for: .normal)
        view.addSubview(badgeNumberButtonTwo)

        badgeNumberButtonThree.frame = CGRect(x: 100, y: 364, width: 150, height: 80)
        badgeNumberButtonThree.isShowBadgeNumber = true
        badgeNumberButtonThree.badgeNumber = 44
        badgeNumberButtonThree.selectPosition = .topCenter
        badgeNumberButtonThree.layer.cornerRadius = 12
        badgeNumberButtonThree.backgroundColor = .purple
        badgeNumberButtonThree.setTitle("Youtube", for: .normal)
        view.addSubview(badgeNumberButtonThree)
    }
}


