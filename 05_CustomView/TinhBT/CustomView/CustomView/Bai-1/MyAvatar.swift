
import UIKit

protocol MyAvatarDelegate: class {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int)
}

final class MyAvatar: UIView {
    
    // MARK: Property
    var userAvatar: UIImageView?
    var userName: UILabel?
    weak var delegate: MyAvatarDelegate?
    var button: UIButton?
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*4/5)
        userAvatar = UIImageView(image: UIImage(named: "avt"))
        userAvatar?.frame = frame
        userAvatar?.contentMode = .scaleAspectFill
        addSubview(userAvatar!)
        
        userName = UILabel(frame: CGRect(x: 0, y: frame.size.height*4/5, width: frame.size.height, height: frame.size.height/5))
        userName?.text = "user name"
        userName?.textAlignment = .center
        userName?.backgroundColor = .lightGray
        userName?.textColor = .blue
        addSubview(userName!)
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        button?.backgroundColor = .clear
        button?.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        addSubview(button!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonDidClick() {
        print("button is clicked!")
        delegate?.myAvatar(self, didSelect: 10)
    }
}
