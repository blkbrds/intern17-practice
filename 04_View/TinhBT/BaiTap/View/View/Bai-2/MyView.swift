
import UIKit

class MyView: UIView {
    
    var avatarImageView: UIImageView?
    var nameLabel: UILabel?
    var markButton: UIButton?
    var name: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        // add user avatar
        avatarImageView = UIImageView(image: UIImage(named: "no_avatar"))
        avatarImageView!.frame = CGRect(x: 0,
                                        y: 0,
                                        width: frame.size.width,
                                        height: frame.size.height*4/5)
        avatarImageView!.contentMode = .scaleAspectFill
        self.addSubview(avatarImageView!)
        
        // add user name
        nameLabel = UILabel(frame: CGRect(x: 0,
                                          y: frame.size.height*4/5,
                                          width: frame.size.width,
                                          height: frame.size.height/5))
        nameLabel!.text = "Fx Studio"
        nameLabel!.backgroundColor = .lightGray
        nameLabel!.textAlignment = .center
        nameLabel!.textColor = .blue
        self.addSubview(nameLabel!)
        
        // add button
        markButton = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: frame.size.width,
                                            height: frame.size.height))
        markButton!.backgroundColor = .clear
        markButton?.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        self.addSubview(markButton!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonDidClick() {
        print("name \(String(describing: nameLabel?.text))")
    }
}
