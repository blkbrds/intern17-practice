//
//  MyViewController.swift
//  BaiTap01
//
//  Created by Phong Huynh N. VN.Danang on 3/24/22.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet private weak var helloLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Add user avatar
//        let frame = CGRect(x:50, y: 100, width: 100, height: 100)
//        let userAvatar = UIImageView(image: UIImage(named: "avatar.jpeg"))
//        userAvatar.frame = frame
//        userAvatar.contentMode = .scaleToFill
//        view.addSubview(userAvatar)
//
//        // Add user name
//        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
//        userName.text = "User name"
//        userName.backgroundColor = .lightGray
//        userName.textColor = .blue
//        userName.center = view.center
//        view.addSubview(userName)
        
        //Add button
        view.backgroundColor = .green
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = .black
        button.setTitle("Tap", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
        // Do any additional s  etup after loading the view.
    }
        
    @objc func buttonDidClick(){
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
