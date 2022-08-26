import UIKit

//Bước 1: Khởi tạo method
//Delegate truyền từ con đến cha (đơn giản)
protocol MyAvatarDelegate{
    func didTap(view: MyAvatar, userName: String)
}

class MyAvatar: UIView {
    
    var avatarImageView: UIImageView?
    var nameLabel: UILabel?
    var markButton: UIButton?
    
    var userName: String!
    
    //Bước 2: Create variable
    var delegate: MyAvatarDelegate?
    
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
        markButton?.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.addSubview(markButton!)
    }
    
    @objc func tap(){
        guard let delegate = delegate, let name = nameLabel?.text else {
            return
        }
        //Bước 3: Uỷ quyền
        delegate.didTap(view: self, userName: name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
