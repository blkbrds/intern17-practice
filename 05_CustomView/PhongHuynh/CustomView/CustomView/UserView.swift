import UIKit

// MARK: - UserViewDelegate
protocol UserViewDelegate: class {
    
    func controller(view: UserView, needsPerfom actions: UserView.Action)
}

class UserView: UIView {
    
    // MARK: - Define
    enum Action {
        case tap(name: String)
    }
    
    // MARK: - Properties
    var name: String?
    var count = 0
    weak var delegate: UserViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    // MARK: - Initialize
    convenience init(frame: CGRect, name: String, count: Int) {
        self.init(frame: frame)
        self.name = name
        self.count = count
        
        let userAvatarImageView = UIImageView(image: UIImage(named: "husky.jpeg"))
        userAvatarImageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height * 4 / 5)
        userAvatarImageView.contentMode = .scaleAspectFit
        self.addSubview(userAvatarImageView)
        let userNameLabel = UILabel(frame: CGRect(x: 0, y: frame.size.height * 4 / 5, width: frame.size.width, height: frame.size.height / 5))
        userNameLabel.text = name
        userNameLabel.backgroundColor = .lightGray
        userNameLabel.textAlignment = .center
        userNameLabel.textColor = .blue
        self.addSubview(userNameLabel)
        let nextButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        nextButton.backgroundColor = .clear
        nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        self.addSubview(nextButton)
    }
    
    // MARK: - Objc functions
    @objc func nextAction() {
        if let delegate = delegate {
            delegate.controller(view: self, needsPerfom: .tap(name: "name\(count)"))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
