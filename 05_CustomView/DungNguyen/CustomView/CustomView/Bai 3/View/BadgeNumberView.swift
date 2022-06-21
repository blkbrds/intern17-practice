//
//  BadgeNumberView.swift
//  CustomView_bai1
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/20/22.
//

import UIKit

final class BadgeNumberView: UIView {
    
    enum BadgeType {
        case topLeft
        case topCenter
        case topRight
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomCenter
        case bottomRight
    }
    
    @IBOutlet private weak var badgeView: UIView!
    @IBOutlet private weak var badgeNumberLabel: UILabel!
    @IBOutlet private weak var contentButton: UIButton!

    
    var name: String = "" {
        didSet {
            contentButton.setTitle(name, for: .normal)
        }
    }
    
    var number: Int = 0 {
        didSet {
            switch number {
            case 0:
                badgeView.isHidden = true
                badgeNumberLabel.text = ""
            case 1...99:
                badgeView.isHidden = false
                badgeNumberLabel.text = "\(number)"
            default:
                badgeView.isHidden = false
                badgeNumberLabel.text = "99+"
            }
            updateBadgeView()
        }
    }
    
    var badgeType: BadgeType = .topLeft {
        didSet {
            setBadgeViewLocation()
        }
    }
    
    var backgroundButtonColor: UIColor? {
        didSet {
            if let color = backgroundButtonColor, let button = contentButton {
                button.backgroundColor = color
            }
        }
    }
    
    func configView(){
        contentButton.layer.cornerRadius = 20
        badgeView.layer.cornerRadius = 15
    }
    
    func setBadgeViewLocation() {
        switch badgeType {
        case .topLeft:
            badgeView.center.x = 0
            badgeView.center.y = 0
        case .topRight:
            badgeView.center.x = contentButton.frame.size.width
            badgeView.center.y = 0
        case .topCenter:
            badgeView.center.x = contentButton.frame.size.width / 2
            badgeView.center.y = 0
        case .centerLeft:
            badgeView.center.x = 0
            badgeView.center.y = contentButton.frame.size.height / 2
        case .centerRight:
            badgeView.center.x = contentButton.frame.size.width
            badgeView.center.y = contentButton.frame.size.height / 2
        case .bottomLeft:
            badgeView.center.x = 0
            badgeView.center.y = contentButton.frame.size.height
        case .bottomCenter:
            badgeView.center.x = contentButton.frame.size.width / 2
            badgeView.center.y = contentButton.frame.size.height
        case .bottomRight:
            badgeView.center.x = contentButton.frame.size.width
            badgeView.center.y = contentButton.frame.size.height
        }
    }

    private func updateBadgeView() {
        var widthLabel: CGFloat = 0.0
        switch number {
        case 1...9:
            widthLabel = badgeNumberLabel.text!.width(constraintedWidth: 40, font: badgeNumberLabel.font)  + 10
        case 10...99:
            widthLabel = badgeNumberLabel.text!.width(constraintedWidth: 40, font: badgeNumberLabel.font)  + 20
        default:
            widthLabel = badgeNumberLabel.text!.width(constraintedWidth: 40, font: badgeNumberLabel.font)  + 35
        }
        badgeNumberLabel.center = CGPoint(x: widthLabel / 2, y: badgeView.frame.size.height / 2)
        badgeView.bounds.size.width = widthLabel
    }
}

extension String {
    
    func width(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        return label.frame.height
     }
}
