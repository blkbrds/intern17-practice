import UIKit

protocol UserViewDelegate {
    func didTap(view: MyAvatar, count: Int)
}

final class MyAvatar: UIView {
    
    var avatarImageView: UIImageView?
    var nameLabel: UILabel?
    var markButton: UIButton?
    var count: Int = 0
    var delegate: UserViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        avatarImageView = UIImageView(image: UIImage(named: "avatar1"))
        avatarImageView!.frame = CGRect(x: 0,
                                        y: 0,
                                        width: frame.size.width,
                                        height: frame.size.height*4/5)
        avatarImageView!.contentMode = .scaleAspectFill
        self.addSubview(avatarImageView!)
        
        nameLabel = UILabel(frame: CGRect(x: 0,
                                          y: frame.size.height*4/5,
                                          width: frame.size.width,
                                          height: frame.size.height/5))
        nameLabel!.text = "Tú Đeep Try"
        nameLabel!.backgroundColor = .lightGray
        nameLabel!.textAlignment = .center
        nameLabel!.textColor = .blue
        self.addSubview(nameLabel!)
        
        markButton = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: frame.size.width,
                                            height: frame.size.height))
        markButton!.backgroundColor = .clear
        markButton?.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.addSubview(markButton!)
    }
    
    @objc private func tap() {
        count += 1
        nameLabel?.text = "\(count)"
        
        guard let delegate = delegate else {
            return
        }

        delegate.didTap(view: self, count: count)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
