//
//  CustomButton.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/10/22.
//

import UIKit

final class CustomButton: UIView {
    var buttonTitle: String = ""
    var buttonColor: UIColor = .blue
    var badgeColor: UIColor = .red
    var badgeContentInset: CGFloat {
        return (badgeLabel.intrinsicContentSize.width + 10) / 2
    }
    
    var xMinButton: CGFloat {
        return button.frame.minX
    }
    
    var xMaxButton: CGFloat {
        return button.frame.maxX
    }
    
    var xMidButton: CGFloat {
        return button.center.x
    }

    var badgePosition: BadgePosition = .topLeft {
        willSet {
            switch newValue {
            
            case .topLeft:
                badgeLabel.frame = setFrameBadge(x: xMinButton - badgeContentInset,
                                                 y: 0)
            case .topRight:
                badgeLabel.frame = setFrameBadge(x: xMaxButton - badgeContentInset,
                                                 y: 0)
            case .topCenter:
                badgeLabel.frame = setFrameBadge(x: xMidButton - badgeContentInset,
                                                 y: 0)
            case .centerLeft:
                badgeLabel.frame = setFrameBadge(x: xMinButton - badgeContentInset,
                                                 y: 40)
            case .centerRight:
                badgeLabel.frame = setFrameBadge(x: xMaxButton - badgeContentInset,
                                                 y: 40)
            case .buttomLeft:
                badgeLabel.frame = setFrameBadge(x: xMinButton - badgeContentInset,
                                                 y: 80)
            case .buttomCenter:
                badgeLabel.frame = setFrameBadge(x: xMidButton - badgeContentInset,
                                                 y: 80)
            case .bottomRight:
                badgeLabel.frame = setFrameBadge(x: xMaxButton - badgeContentInset,
                                                 y: 80)
            }
        }
    }
    
    var badgeTitle: String = "" {
        willSet {
            guard let number = Int(newValue) else {return}
            if number == 0 {
                print("-----")
                badgeLabel.isHidden = true
            } else {
                badgeLabel.isHidden = false
                badgeLabel.text = newValue
            }
        }
    }

    @IBOutlet weak var badgeView: UIView!

    @IBOutlet weak var button: UIButton!

    @IBOutlet weak var badgeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setFrameBadge(x: CGFloat, y: CGFloat) -> CGRect {
        return CGRect(x: x,
                      y: y,
                      width: badgeLabel.intrinsicContentSize.width + 10,
                      height: 20)
    }

}
