import UIKit

// MARK: - UserViewDelegate
protocol UserViewDelegate: AnyObject {
    func didTap(view: UserView, needsPerfom action: UserView.Action)
}

final class UserView: UIView {

    // MARK: - Define
    enum Action {
        case tap(name: String)
    }

    var count = 0
    weak var delegate: UserViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        // add user avatar
        let userAvatar = UIImageView(image: UIImage(named: "husky.jpeg"))
        userAvatar.frame = CGRect(x: 0,
                                  y: 0,
                                  width: frame.size.width,
                                  height: frame.size.height*4/5)
        userAvatar.contentMode = .scaleAspectFit
        self.addSubview(userAvatar)
               
       // add user name
        let userName = UILabel(frame: CGRect(x: 0,
                                             y: frame.size.height*4/5,
                                             width: frame.size.width,
                                             height: frame.size.height/5))
        userName.text = "name"
        userName.backgroundColor = .lightGray
        userName.textAlignment = .center
        userName.textColor = .blue
        self.addSubview(userName)
               
        // add button
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
            delegate.didTap(view: self, needsPerfom: .tap(name: "name"))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
