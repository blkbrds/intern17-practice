//
//  MyAvatar.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 18/05/2022.
//

import UIKit

final class MyAvatar: UIView {

    var avatarImageView: UIImageView?
    var nameLabel: UILabel?
    var count: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        //add user avatar
        avatarImageView = UIImageView(image: UIImage(named: "avatar1"))
        avatarImageView!.frame = CGRect(x: 0, y: 0, width: frame.size.width , height: frame.size.height * 4/5)
        avatarImageView!.contentMode = .scaleAspectFill
        self.addSubview(avatarImageView!)
        //add user nae
        nameLabel = UILabel(frame: CGRect(x: 0, y: frame.size.height * 4/5, width: frame.size.width, height: frame.size.height/5))
        nameLabel!.text = "Username"
        nameLabel!.backgroundColor = .lightGray
        nameLabel!.textAlignment = .center
        nameLabel!.textColor = .blue
        self.addSubview(nameLabel!)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
