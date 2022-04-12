import UIKit

class CustomButtonView: UIView {
    
    // MARK: - Define
    enum BadgeNumberPosition {
        case topLeft
        case topRight
        case topCenter
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomRight
        case bottomCenter
    }
    
    // MARK: - Properties
    var userName1: UILabel?
    var userView: UIView?
    var userName2: UILabel?
    var number: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    
    // MARK: - Initialize
    convenience init(frame: CGRect, number: Int, position: BadgeNumberPosition, name: String) {
        self.init(frame: frame)
        self.number = number
        
        // add UIView
        userView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        guard let userView = userView else { return }
        userView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        userView.layer.cornerRadius = 8
        self.addSubview(userView)
                           
       // add user name
        userName1 = UILabel(frame: CGRect(x: 0, y: frame.size.height * 3 / 5, width: 40, height: 40))
        guard let userName1 = userName1 else { return }
        userName1.clipsToBounds = true
        userName1.layer.cornerRadius = 20
        userName1.backgroundColor = .lightGray
        userName1.textAlignment = .center
        userName1.textColor = .blue
        self.addSubview(userName1)
        userName2 = UILabel(frame: CGRect(x: 0, y: frame.size.height * 2 / 5, width: userView.frame.size.width, height: 40))
        guard let userName2 = userName2 else { return }
        userName2.backgroundColor = .clear
        userName2.textAlignment = .center
        userName2.text = name
        userName2.textColor = .blue
        userName2.center = userView.center
        self.addSubview(userName2)
        setPositionLabel(potision: position)
        setBadgeNumber()
        
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPositionLabel(potision: BadgeNumberPosition) {
        guard let userName1 = userName1, let userView = userView else { return }
        switch potision {
        case .topLeft:
            userName1.center.x = 0
            userName1.center.y = 0
        case .topRight:
            userName1.center.x = userView.frame.size.width
            userName1.center.y = 0
        case .topCenter:
            userName1.center.x = userView.frame.size.width / 2
            userName1.center.y = 0
        case .centerLeft:
            userName1.center.x = 0
            userName1.center.y = userView.frame.size.height / 2
        case .centerRight:
            userName1.center.x = userView.frame.size.width
            userName1.center.y = userView.frame.size.height / 2
        case .bottomLeft:
            userName1.center.x = 0
            userName1.center.y = userView.frame.size.height
        case .bottomRight:
            userName1.center.x = userView.frame.size.width
            userName1.center.y = userView.frame.size.height
        case .bottomCenter:
            userName1.center.x = userView.frame.size.width / 2
            userName1.center.y = userView.frame.size.height
        }
    }
    
    func setBadgeNumber() {
        guard let userName1 = userName1 else { return }
        if number == 0 {
            userName1.isHidden = true
        } else if number > 99 {
            userName1.text = "99+"
        } else {
            userName1.text = "\(number)"
        }
    }
}
