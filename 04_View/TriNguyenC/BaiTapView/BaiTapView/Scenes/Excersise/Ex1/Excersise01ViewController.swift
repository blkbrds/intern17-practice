//
//  Excersise01ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 30/03/2022.
//

import UIKit

final class Excersise01ViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // frame
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        
        // user avatar
        let userAvatar = UIImageView(image: UIImage(named: "ic-user"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // username
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 25))
        userName.text = "User name"
        userName.backgroundColor = .lightGray
        userName.textAlignment = .center
        userName.textColor = .white
        view.addSubview(userName)
        
        // add button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 225))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(tapTouchUpInside), for: .touchUpInside)
        view.addSubview(button)
    }
    
    // objc
    @objc func tapTouchUpInside() {
        print("tap tap tap")
    }
}
