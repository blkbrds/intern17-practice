//
//  Excersise02ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 30/03/2022.
//

import UIKit

final class Excersise02ViewController: UIViewController {

    // MARK: - Properties
    private let names: [String] = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8", "user9"]
    private let images: [String] = ["person.fill", "person.fill","person.fill","person.fill","person.fill","person.fill","person.fill","person.fill","person.fill"]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 20
        let widthScreen = UIScreen.main.bounds.width
        
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 175
        var xUserView: CGFloat = space
        var yUserView: CGFloat = 60
        
        for index in 0..<names.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            
            let userView = createUserView(frame: frame, index: index)
            view.addSubview(userView)
            
            // Tinh frame
            if xUserView + widthUserView > widthScreen - xUserView {
                // thay doi x and y
                yUserView += heightUserView + space
                xUserView = space
            } else {
                xUserView += widthUserView + space
            }
        }
    }
    
    // MARK: - Method
    func createUserView(frame: CGRect, index: Int) -> UIView {
        let userView = UIView(frame: frame)
        
        // add Avatar
        let avatar = UIImageView(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 25))
        avatar.image = UIImage(systemName: images[index])
        avatar.contentMode = .scaleToFill
        userView.addSubview(avatar)
        
        // add name
        let name = UILabel(frame: CGRect(x: 0, y: 150, width: userView.bounds.width, height: userView.bounds.height - avatar.bounds.height))
        name.text = names[index]
        name.textAlignment = .center
        name.backgroundColor = .gray
        userView.addSubview(name)
        
        // button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        button.backgroundColor = .clear
        let tapGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(buttonDidClick))
        tapGestureRecognizer.name = names[index]
        button.addGestureRecognizer(tapGestureRecognizer)
        userView.addSubview(button)
        
        return userView
    }
    
    @objc func buttonDidClick(_ sender: UITapGestureRecognizer) {
        let username = sender.name
        print("Name user is \(username ?? "no name")")
    }
}
