//
//  UserViewController.swift
//  ExerciseView
//
//  Created by thuan.nguyen on 22/04/2022.
//

import UIKit

class UserViewController: UIViewController {

    private let names: [String] = ["name1", "name2", "name3", "name4", "name5", "name6", "name7", "name8", "name9"]
    var x: CGFloat = 50
    var y: CGFloat = 100
    let imgW: CGFloat = 100
    let imgh: CGFloat = 125
    let space: CGFloat = 10
    let screenSize: CGFloat = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<names.count {
            let userView = UserView(frame: CGRect(x: x, y: y, width: imgW, height: imgh))
            userView.nameLabel?.text = names[i]
            userView.avatarImageView?.image = UIImage(named: "avatar1.png")
            view.addSubview(userView)
            
            if x + imgh > screenSize - imgW {
                x = 50
                y = y + imgh + space
            } else {
                x += space + imgW
            }
            
        }
    }

}
