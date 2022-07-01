import UIKit

protocol UserViewDelegate: AnyObject {
    func view(_ view: MyUserView, needsPerform action: MyUserView.Action)
}

protocol MyUserViewDataSource: AnyObject {
    func view() -> String
}

final class MyUserView: UIView {
    
    enum Action {
        case tapped(count: Int)
    }
    
    var avatarImageView: UIImageView = UIImageView()
    var nameLabel: UILabel = UILabel()
    var markButton: UIButton = UIButton()
    var count: Int = 0
    weak var delegate: UserViewDelegate?
    weak var dataSource: MyUserViewDataSource?
    
    init(frame: CGRect, name: String, i: Int) {
        super.init(frame: frame)
        backgroundColor = .blue
        count = i
        
        avatarImageView = UIImageView(image: UIImage(named: "no_avatar"))
        avatarImageView.frame = CGRect(x: 0,
                                       y: 0,
                                       width: frame.size.width,
                                       height: frame.size.height*4/5)
        avatarImageView.contentMode = .scaleAspectFill
        addSubview(avatarImageView)
        
        nameLabel = UILabel(frame: CGRect(x: 0,
                                          y: frame.size.height*4/5,
                                          width: frame.size.width,
                                          height: frame.size.height/5))
        nameLabel.text = name
        nameLabel.backgroundColor = .lightGray
        nameLabel.textAlignment = .center
        nameLabel.textColor = .blue
        addSubview(nameLabel)
        
        markButton = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: frame.size.width,
                                            height: frame.size.height))
        markButton.backgroundColor = .clear
        markButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        addSubview(markButton)
    }
    
    func getData() {
        guard let dataSource = dataSource else {
            return
        }
        
        nameLabel.text = dataSource.view()
    }
    
    @objc private func tapped() {
        delegate?.view(self, needsPerform: Action.tapped(count: count))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
