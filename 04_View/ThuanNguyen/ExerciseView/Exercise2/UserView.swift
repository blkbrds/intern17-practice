//
//  UserView.swift
//  ExerciseView
//
//  Created by thuan.nguyen on 22/04/2022.
//

import UIKit

class UserView: UIView {
    var avatarImageView: UIImageView?
    var nameLabel: UILabel?
    var markButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        // add user avatar
        avatarImageView = UIImageView(image: UIImage(named: "avatar1.png"))
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
        nameLabel!.text = "name"
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
        markButton!.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.addSubview(markButton!)
    }
    
    @objc func tap(){
        print("Tên User\(nameLabel?.text ?? "")")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
