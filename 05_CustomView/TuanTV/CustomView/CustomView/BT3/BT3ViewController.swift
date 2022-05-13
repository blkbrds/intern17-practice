//
//  BT3ViewController.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/10/22.
//

import UIKit

final class BT3ViewController: UIViewController {
    
    private var widthView: CGFloat = UIScreen.main.bounds.width
    let widthCustomButton: CGFloat = 260
    let heightCustomButton: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let customButton1 = setupButton()
        let customButton2 = setupButton(y: 150,
                                        title: "Friends",
                                        badgeTitle: "1000",
                                        badgePosition: .topLeft,
                                        backgroundColor: .green)
        let customButton3 = setupButton(y: 250,
                                        title: "Photos",
                                        badgeTitle: "1",
                                        badgePosition: .buttomCenter,
                                        backgroundColor: .purple)
        view.addSubview(customButton1!)
        view.addSubview(customButton2!)
        view.addSubview(customButton3!)
    }
    
    private func setupButton(y: CGFloat = 50,
                             title: String = "Email",
                             badgeTitle: String = "10",
                             badgePosition: BadgePosition = .topLeft,
                             backgroundColor: UIColor = .yellow) -> CustomButton? {
        let customButton = Bundle.main.loadNibNamed("CustomButton", owner: self, options: nil)?[0] as? CustomButton
        customButton?.frame = CGRect(x: widthView / 2 - widthCustomButton / 2,
                                     y: y,
                                     width: widthCustomButton,
                                     height: heightCustomButton)
        customButton?.button.backgroundColor = backgroundColor
        customButton?.button.setTitle(title, for: .normal)
        customButton?.button.layer.cornerRadius = 10
        customButton?.badgeLabel.backgroundColor = .red
        customButton?.badgeTitle = badgeTitle
        customButton?.badgePosition = badgePosition
        customButton?.badgeLabel.layer.cornerRadius = 6
        customButton?.badgeLabel.layer.masksToBounds = true
        return customButton
    }
}

enum BadgePosition {
    case topLeft
    case topRight
    case topCenter
    case centerLeft
    case centerRight
    case buttomLeft
    case buttomCenter
    case bottomRight
}
