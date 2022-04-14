import UIKit

// MARK: - UserViewDelegate
protocol UserViewDelegate: class {
    func didTap(view: UserView, needsPerfom action: UserView.Action)
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
        
        let userAvatar = UIImageView(image: UIImage(named: "husky.jpeg"))
        userAvatar.frame = CGRect(x: 0,
                                  y: 0,
                                  width: frame.size.width,
                                  height: frame.size.height*4/5)
        userAvatar.contentMode = .scaleAspectFit
        self.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 0,
                                             y: frame.size.height*4/5,
                                             width: frame.size.width,
                                             height: frame.size.height/5))
        userName.text = name
        userName.backgroundColor = .lightGray
        userName.textAlignment = .center
        userName.textColor = .blue
        self.addSubview(userName)
        
        let button = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: frame.size.width,
                                            height: frame.size.height))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
        self.addSubview(button)
    }
    
    // MARK: - Objc functions
    @objc func nextButton() {
        if let delegate = delegate {
            delegate.didTap(view: self, needsPerfom: .tap(name: "name\(count)"))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
