//
//  UserViewController.swift
//  View
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/13/22.
//

import UIKit

class UserViewController: UIViewController {
    
    let names: [String] = ["Name1", "Name2", "Name3", "Name4", "Name5", "Name6", "Name7", "Name8", "Name9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        displayView(names: names)
    }
    
    func displayView(names: [String]) {
        let distance: CGFloat = 10
        let widthView: CGFloat = CGFloat((UIScreen.main.bounds.width - 40) / 3)
        for index in 0..<names.count {
            var x = distance * (CGFloat(index) + 1) + widthView * CGFloat(index)
            var y = distance
            if x >= UIScreen.main.bounds.width {
                let x1 = CGFloat(index % 3) * widthView
                let x2 = (CGFloat(index % 3) + 1) * distance
                x = x1 + x2
                y = distance * (CGFloat(index / 3) + 1) + 120 * CGFloat(index / 3)
            }
            
            let userView = clickUserView(frame: CGRect(x: x, y: y, width: widthView, height: 120), name: names[index], index: index)
            view.addSubview(userView)
        }
    }
    
    func clickUserView(frame: CGRect, name: String, index: Int) -> UIView {
        
        let userView = UIView(frame: frame)
        let frame = CGRect(x: 0, y: 50, width: userView.bounds.width, height: userView.bounds.height)
        
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        userView.addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: 0, y: userView.bounds.height + 20, width: userView.bounds.width, height: 30))
        userName.text = name
        userName.backgroundColor = .systemBlue
        userName.textColor = .white
        userName.textAlignment = .center
        userView.addSubview(userName)
        
        // Add button
        let button = UIButton(frame: frame)
        button.backgroundColor = .clear
        button.tag = index
        button.addTarget(self, action: #selector(buttonDidClick(sender:)), for: .touchUpInside)
        userView.addSubview(button)
        
        return userView
    }
    
    @objc func buttonDidClick(sender: UIButton) {
        print("Button is clicked - index = \(names[sender.tag])")
    }
}
