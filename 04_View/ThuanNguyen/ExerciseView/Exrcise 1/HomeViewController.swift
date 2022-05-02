//
//  HomeViewController.swift
//  ExerciseView
//
//  Created by thuan.nguyen on 22/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 25))
        userName.text = "Name User"
        userName.textAlignment = .center
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        view.addSubview(userName)
        
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 220))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
        
    }
    @objc func tap() {
        print("tap tap tap ")
    }

    

}
