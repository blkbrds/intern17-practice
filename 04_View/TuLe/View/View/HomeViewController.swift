//
//  HomeViewController.swift
//  Demo
//
//  Created by tu.le2 on 10/06/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let spaceX: Int = 10
    var widthFrame: CGFloat = (UIScreen.main.bounds.width - 40)/3
    var heightFrame: Int = 100
    var count: Int = 1
    var userNameLabel: UILabel?
    var name: [String] = ["name1", "name2", "name3", "name4" ,"name5", "name6", "name7", "name8", "name9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUser()
    }
    
    private func setUpUser() {
        for i in 0..<name.count {
            let xFrame = (spaceX * (i % 3 + 1) + ((i % 3 + 1) - 1) * Int(widthFrame))
            let yFrame = 100 + 150 * (count - 1) + spaceX * (count - 1)
            let yUser = 200 + 150 * (count - 1) + spaceX * (count - 1)
            if xFrame < Int(UIScreen.main.bounds.width) {
                createUser(x: xFrame, y: yFrame, yUser: yUser, i: i)
            }
            if i % 3 == 2 {
                count += 1
            }
        }
    }
    
    private func createUser(x: Int, y: Int, yUser: Int, i: Int) {
        let frame = CGRect(x: x, y: y, width: Int(widthFrame), height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar1"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        userNameLabel = UILabel(frame: CGRect(x: x, y: yUser, width: Int(widthFrame), height: 45))
        userNameLabel?.text = name[i]
        userNameLabel!.backgroundColor = .blue
        userNameLabel!.textColor = .white
        userNameLabel!.textAlignment = .center
        view.addSubview(userNameLabel!)
        
        let button = UIButton(frame: CGRect(x: x, y: y, width: Int(widthFrame), height: 250))
        button.backgroundColor = .clear
        let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonUserDidClick))
        gesture.name = name[i]
        button.addGestureRecognizer(gesture)
        view.addSubview(button)
    }
    
    @objc private func buttonUserDidClick(sender: UIGestureRecognizer) {
        if let name = sender.name {
            print(name)
        }
    }
}
