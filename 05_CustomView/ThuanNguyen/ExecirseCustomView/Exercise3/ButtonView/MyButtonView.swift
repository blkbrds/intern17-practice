//
//  MyButtonView.swift
//  ExecirseCustomView
//
//  Created by thuan.nguyen on 26/04/2022.
//

import UIKit

class MyButtonView: UIButton {
    
    var badgeLabel = UILabel()
    enum Postion {
        case topLeft, topRight, topCenter, centerLeft, centerRight, bottomLeft, bottomCenter, bottomRight
        func handelPostion(frame: CGRect) -> CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .topRight:
                return CGPoint(x: frame.maxX, y: frame.maxY)
            case .topCenter:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .centerLeft:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .centerRight:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .bottomLeft:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .bottomCenter:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .bottomRight:
                return CGPoint(x: frame.minX, y: frame.minY)
            }
        }
    }
    var badgeNumber: Int = 0 {
        didSet {
            updateBadgeNumberLabel()
        }
    }
    
    var isShowBadgeNumber: Bool = false {
        didSet {
            showBadgeNumber()
        }
    }
    
    var selectPosition: Postion = .topRight {
        didSet {
            numberBadgeLabel.center = selectPosition.handelPostion(frame: bounds)
        }
    }
    private lazy var numberBadgeLabel: UILabel = {
        let label = UILabel()
        label.bounds.size = CGSize(width: 50, height: 30)
        label.backgroundColor = .red
        label.textColor = .white
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private func updateBadgeNumberLabel() {
        if badgeNumber == 0 {
            numberBadgeLabel.isHidden = true
        } else {
            if badgeNumber >= 1 && badgeNumber <= 99 {
                numberBadgeLabel.text = String(badgeNumber)
            } else if badgeNumber > 99 {
                numberBadgeLabel.text = "99+"
            }
        }
    }
    private func showBadgeNumber() {
        if isShowBadgeNumber {
            self.addSubview(numberBadgeLabel)
        } else {
            numberBadgeLabel.isHidden = true
        }
    }
    
}
