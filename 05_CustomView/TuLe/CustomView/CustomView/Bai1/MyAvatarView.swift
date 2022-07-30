import UIKit

protocol UserViewDelegate: AnyObject {
    func view(_ view: MyAvatarView, needsPerform action: MyAvatarView.Action)
}

final class MyAvatarView: UIView {
    
    enum Action {
        case tapped(count: Int)
    }
    
    var avatarImageView: UIImageView = UIImageView()
    var nameLabel: UILabel = UILabel()
    var markButton: UIButton = UIButton()
    var count: Int = 0
    weak var delegate: UserViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        avatarImageView = UIImageView(image: UIImage(named: "avatar1"))
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
        nameLabel.text = "Tú Đeep Try"
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
    
    @objc private func tapped() {
        count += 1
        nameLabel.text = "\(count)"
        delegate?.view(self, needsPerform: Action.tapped(count: count))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder) 
    }
    
}
