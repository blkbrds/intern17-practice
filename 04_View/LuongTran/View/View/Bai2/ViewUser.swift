//
//  ViewUser.swift
//  View
//
//  Created by luong.tran on 19/08/2022.
//

import UIKit

class ViewUser: UIView {
    var userAvatar: UIImageView?
    var userName: UILabel?
    var button: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
            
        // add user avatar
        userAvatar = UIImageView(image: UIImage(systemName: "person.fill"))
        userAvatar!.frame = CGRect(x: 0,
                                y: 0,
                                width: frame.size.width,
                                height: frame.size.height*4/5)
        userAvatar!.contentMode = .scaleAspectFit
        self.addSubview(userAvatar!)
                   
        // add user name
        userName = UILabel(frame: CGRect(x: 0,
                                            y: frame.size.height*4/5,
                                            width: frame.size.width,
                                            height: frame.size.height/5))
        userName!.text = "Person"
        userName!.backgroundColor = .lightGray
        userName!.textAlignment = .center
        userName!.textColor = .blue
        self.addSubview(userName!)
                   
        // add button
        button = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: frame.size.width,
                                            height: frame.size.height))
        button!.addTarget(self, action: #selector(btnTouch), for: .touchUpInside)
        button!.backgroundColor = .clear
        self.addSubview(button!)
    }
    
    @objc func btnTouch(){
        print("ABC")
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
