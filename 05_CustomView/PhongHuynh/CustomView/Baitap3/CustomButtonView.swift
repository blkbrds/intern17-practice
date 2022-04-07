import UIKit

class CustomButtonView: UIView {
    
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
    
    var nameLabel: UILabel?
    var customView: UIView?
    var nameLabel1: UILabel?
    var number: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    
    convenience init(frame: CGRect, number: Int, position: BadgeNumberPosition, name: String) {
        self.init(frame: frame)
        self.number = number
        
        // add UIView
        customView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        customView?.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        customView?.layer.cornerRadius = 8
        self.addSubview(customView!)
                           
       // add user name
        nameLabel = UILabel(frame: CGRect(x: 0, y: frame.size.height * 3 / 5, width: 40, height: 40))
        nameLabel1 = UILabel(frame: CGRect(x: 0, y: frame.size.height * 2 / 5, width: (customView?.frame.size.width)!, height: 40))
        nameLabel1!.backgroundColor = .clear
        nameLabel1!.textAlignment = .center
        nameLabel1!.text = name
        nameLabel1!.textColor = .blue
        nameLabel1?.center = customView!.center
        
//        nameLabel1?.center.y = (customView?.center.y)!
        setPositionLabel(potision: position)
        setBadgeNumber()
        nameLabel?.clipsToBounds = true
        nameLabel!.layer.cornerRadius = 20
        
        nameLabel!.backgroundColor = .lightGray
        nameLabel!.textAlignment = .center
        nameLabel!.textColor = .blue
        self.addSubview(nameLabel!)
        self.addSubview(nameLabel1!)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPositionLabel(potision: BadgeNumberPosition) {
        guard let nameLabel = nameLabel, let customView = customView else { return }
        switch potision {
        case .topLeft:
            nameLabel.center.x = 0
            nameLabel.center.y = 0
        case .topRight:
            nameLabel.center.x = customView.frame.size.width
            nameLabel.center.y = 0
        case .topCenter:
            nameLabel.center.x = customView.frame.size.width / 2
            nameLabel.center.y = 0
        case .centerLeft:
            nameLabel.center.x = 0
            nameLabel.center.y = customView.frame.size.height / 2
        case .centerRight:
            nameLabel.center.x = customView.frame.size.width
            nameLabel.center.y = customView.frame.size.height / 2
        case .bottomLeft:
            nameLabel.center.x = 0
            nameLabel.center.y = customView.frame.size.height
        case .bottomRight:
            nameLabel.center.x = customView.frame.size.width
            nameLabel.center.y = customView.frame.size.height
        case .bottomCenter:
            nameLabel.center.x = customView.frame.size.width / 2
            nameLabel.center.y = customView.frame.size.height
        }
    }
    
    func setBadgeNumber() {
        if number == 0 {
            nameLabel?.isHidden = true
        } else if number > 99 {
            nameLabel?.text = "99+"
        } else {
            nameLabel?.text = "\(number)"
        }
    }
}
