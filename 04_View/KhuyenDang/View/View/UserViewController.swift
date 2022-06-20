//
//  UserViewController.swift
//  View
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/14/22.
//

import UIKit

final class UserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        // add user avt
        let frame = CGRect(x: 50, y: 100, width: 120, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.jpeg"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // add user name
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 120, height: 40))
        userName.text = "User name"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        userName.textAlignment = .center
        view.addSubview(userName)
        // add button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 120, height: 140))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonDidClick() {
        print("clicked")
        
    }
}
