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
    var xMinButton: CGFloat {
        return button.frame.minX
    }
    var xMaxButton: CGFloat {
        return button.frame.maxX
    }
    var xMidButton: CGFloat {
        return button.center.x
    }

    var badgePosition: BadgePosition = .TopLeft {
        
        
        willSet {
            switch newValue {
            
            case .TopLeft:
                badgeLabel.frame = CGRect(x: xMinButton - (badgeLabel.intrinsicContentSize.width + 10) / 2, y: 0, width: badgeLabel.intrinsicContentSize.width + 10, height: 20 )
            case .TopRight:
                badgeLabel.frame = CGRect(x: xMaxButton - (badgeLabel.intrinsicContentSize.width + 10) / 2, y: 0, width: badgeLabel.intrinsicContentSize.width + 10, height: 20)
            case .TopCenter:
                badgeLabel.frame = CGRect(x: xMidButton - (badgeLabel.intrinsicContentSize.width + 10) / 2, y: 0, width: badgeLabel.intrinsicContentSize.width + 10, height: 20)
            case .CenterLeft:
                badgeLabel.frame = CGRect(x: xMinButton - (badgeLabel.intrinsicContentSize.width + 10) / 2, y: 40, width: badgeLabel.intrinsicContentSize.width + 10, height: 20)
            case .CenterRight:
                badgeLabel.frame = CGRect(x: xMaxButton - (badgeLabel.intrinsicContentSize.width + 10) / 2, y: 40, width: badgeLabel.intrinsicContentSize.width + 10, height: 20)
            case .BottomLeft:
                badgeLabel.frame = CGRect(x: xMinButton - (badgeLabel.intrinsicContentSize.width + 10) / 2, y: 80, width: badgeLabel.intrinsicContentSize.width + 10, height: 20)
            case .BottomCenter:
                badgeLabel.frame = CGRect(x: xMidButton - (badgeLabel.intrinsicContentSize.width + 10) / 2, y: 80, width: badgeLabel.intrinsicContentSize.width + 10, height: 20)
            case .BottomRight:
                badgeLabel.frame = CGRect(x: xMaxButton - (badgeLabel.intrinsicContentSize.width + 10) / 2, y: 80, width: badgeLabel.intrinsicContentSize.width + 10, height: 20)
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

}
