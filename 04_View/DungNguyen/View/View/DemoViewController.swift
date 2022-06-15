//
//  DemoViewController.swift
//  View
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/13/22.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Add user avatar
        let frame = CGRect(x: 20, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: 20, y: 200, width: 100, height: 30))
        userName.text = "Name"
        userName.backgroundColor = .systemBlue
        userName.textColor = .white
        userName.textAlignment = .center
        view.addSubview(userName)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonDidClick() {
        print("Button is clicked")
    }
}
