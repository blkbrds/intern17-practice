//
//  BadButtonView.swift
//  CustomView
//
//  Created by tri.nguyen on 12/04/2022.
//

import Foundation
import UIKit

final class BadButtonView: UIButton {
    
    // MARK: - Enum Position
    enum BadgeNumberPosition {
        case topLeft
        case topRight
        case topCenter
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomCenter
        case bottomRight
        
        func handleBadgeNumberPosition(with frame: CGRect) -> CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .topRight:
                return CGPoint(x: frame.maxX, y: frame.minY)
            case .topCenter:
                return CGPoint(x: frame.midX, y: frame.minY)
            case .centerLeft:
                return CGPoint(x: frame.minX, y: frame.midY)
            case .centerRight:
                return CGPoint(x: frame.maxX, y: frame.midY)
            case .bottomLeft:
                return CGPoint(x: frame.minX, y: frame.maxY)
            case .bottomCenter:
                return CGPoint(x: frame.midX, y: frame.maxY)
            case .bottomRight:
                return CGPoint(x: frame.maxX, y: frame.maxY)
            }
        }
    }
    
    // MARK: - Observer Properties
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
    
    var selectPosition: BadgeNumberPosition = .topRight {
        didSet {
            numberBadgeLabel.center = selectPosition.handleBadgeNumberPosition(with: bounds)
        }
    }
    
    // MARK: - Computed Properties
    private lazy var numberBadgeLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 44, height: 22)
        label.backgroundColor = .red
        label.textColor = .white
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Private Functions
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
