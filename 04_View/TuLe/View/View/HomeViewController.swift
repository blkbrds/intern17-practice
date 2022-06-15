//
//  HomeViewController.swift
//  Demo
//
//  Created by tu.le2 on 10/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    let kc: Int = 10
    var kcY : Int = 100
    var widthFrame: CGFloat = (UIScreen.main.bounds.width - 40)/3
    var heightFrame: Int = 100
    var count: Int = 1
    var userName: UILabel?
    var name: [String] = ["name1", "name2", "name3", "name4" ,"name5", "name6", "name7", "name8", "name9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<name.count {
            let xFrame = (kc * (i % 3 + 1) + ((i % 3 + 1) - 1) * Int(widthFrame))
            print(count)
            let yFrame = 100 + 150 * (count - 1) + kc * (count - 1)
            let yUser = 200 + 150 * (count - 1) + kc * (count - 1)
            print(yFrame)
            if xFrame < Int(UIScreen.main.bounds.width) {
                let frame = CGRect(x: xFrame, y: yFrame, width: Int(widthFrame), height: 100)
                let userAvatar = UIImageView(image: UIImage(named: "avatar1"))
                userAvatar.frame = frame
                userAvatar.contentMode = .scaleToFill
                view.addSubview(userAvatar)
                
                userName = UILabel(frame: CGRect(x: xFrame, y: yUser, width: Int(widthFrame), height: 45))
                userName?.text = name[i]
                userName!.backgroundColor = .blue
                userName!.textColor = .white
                userName!.textAlignment = .center
                view.addSubview(userName!)
                
                let button = UIButton(frame: CGRect(x: xFrame, y: yFrame, width: Int(widthFrame), height: 250))
                button.backgroundColor = .clear
                let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
                gesture.name = name[i]
                button.addGestureRecognizer(gesture)
                view.addSubview(button)
            }
            if i % 3 == 2 {
                count += 1
            }
        }
    }
    
    @objc func buttonDidClick(sender: UIGestureRecognizer) {
        if let name = sender.name {
            print(name)
        }
    }
}
