
import UIKit

final class BadButtonView: UIButton {
    
    enum BadgeNumberPosition {
        case topLeft
        case topRight
        case topCenter
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomCenter
        case bottonRight
        
        func handle(with frame: CGRect) -> CGPoint {
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
            case .bottonRight:
                return CGPoint(x: frame.maxY, y: frame.maxY)
            }
        }
    }
    
    // MARK: Property
    var badgeNumber: Int = 0 {
        didSet	{
            updateBadgeNumber()
        }
    }
    
    var isShowBadge: Bool = false {
        didSet {
            showBadge()
        }
    }
    
    var selectPosition: BadgeNumberPosition = .topRight {
        didSet {
            badgeNumberLabel.center = selectPosition.handle(with: bounds)
        }
    }
    
     private lazy var badgeNumberLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 44, height: 22)
        label.backgroundColor = .red
        label.textColor = .white
        label.layer.cornerRadius = 11
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - function
    func updateBadgeNumber() {
        if badgeNumber == 0 {
            badgeNumberLabel.isHidden = true
        } else if badgeNumber > 0 && badgeNumber < 100 {
            badgeNumberLabel.text = String(badgeNumber)
        } else if badgeNumber > 99 {
            badgeNumberLabel.text = "99+"
        }
    }
    
    func showBadge() {
        if isShowBadge {
            self.addSubview(badgeNumberLabel)
        } else {
            badgeNumberLabel.isHidden = true
        }
    }
}
