//
//  Ex3ButtonViewController.swift
//  ExecirseCustomView
//
//  Created by thuan.nguyen on 26/04/2022.
//

import UIKit

class Ex3ButtonViewController: UIViewController {
    
    private let buttonOne = MyButtonView()
    private let buttonTwo = MyButtonView()
    private let buttonThree = MyButtonView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
    
        buttonOne.frame = CGRect(x: 130, y: 150, width: 150, height: 100)
        buttonOne.isShowBadgeNumber = true
        buttonOne.badgeNumber = 10
        buttonOne.selectPosition = .topRight
        buttonOne.layer.cornerRadius = 12
        buttonOne.backgroundColor = .green
        buttonOne.setTitle("Email", for: .normal)
        buttonOne.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonOne)
                
        buttonTwo.frame = CGRect(x: 130, y: 300, width: 150, height: 100)
        buttonTwo.backgroundColor = .yellow
        buttonTwo.layer.cornerRadius = 12
        buttonTwo.setTitle("Friends", for: .normal)
        buttonTwo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        buttonTwo.isShowBadgeNumber = true
        buttonTwo.selectPosition = .topLeft
        buttonTwo.badgeNumber = 1000
        view.addSubview(buttonTwo)
        
        buttonThree.frame = CGRect(x: 130, y: 450, width: 150, height: 100)
        buttonThree.backgroundColor = .purple
        buttonThree.layer.cornerRadius = 12
        buttonThree.setTitle("Photos", for: .normal)
        buttonThree.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        buttonThree.isShowBadgeNumber = true
        buttonThree.selectPosition = .bottomCenter
        buttonThree.badgeNumber = 8
        view.addSubview(buttonThree)
    }

}
