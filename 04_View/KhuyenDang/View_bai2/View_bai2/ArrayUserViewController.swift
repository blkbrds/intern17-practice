//
//  ArrayUserViewController.swift
//  View_bai2
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/14/22.
//

import UIKit

class ArrayUserViewController: UIViewController {
    let names: [String] = ["Name1", "Name2", "Name3","Name4", "Name5", "Name6", "Name7", "Name8", "Name9"]
    override func viewDidLoad() {
        super.viewDidLoad()
        listUser()
    }
    
    func listUser() {
        var xUser: CGFloat = 15
        var yUser: CGFloat = 100
        let widthUser: CGFloat = CGFloat((UIScreen.main.bounds.width - 15 * 4) / 3)
        
        for i in 0...2 {
            for j in 0...2 {
                user(x: xUser, y: yUser , width: widthUser, name: names[j + i * 3], index: j + i * 3)
                xUser += 15 + widthUser
            }
            xUser = 15
            yUser += 100 + 40 + 15
        }
    }
    
    func user(x: CGFloat, y: CGFloat, width: CGFloat, name: String, index: Int) {
        // add user avt
        let frame = CGRect(x: x, y: y, width: width, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.jpeg"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        //add username
        let userName = UILabel(frame: CGRect(x: x, y: (y + 100), width: width, height: 40))
        userName.text = name
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        userName.textAlignment = .center
        view.addSubview(userName)
        
        // add button
        let button = UIButton(frame: CGRect(x: x, y: y, width: width, height: 140))
            button.backgroundColor = .clear
            button.tag = index
            button.addTarget(self, action: #selector(buttonDidClick(sender:)), for: .touchUpInside)
            view.addSubview(button)
    }
    
    @objc func buttonDidClick(sender: UIButton) {
        print("clicked \(names[sender.tag])")
    }
}
