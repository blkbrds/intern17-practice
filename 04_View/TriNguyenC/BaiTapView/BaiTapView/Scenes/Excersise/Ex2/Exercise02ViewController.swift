//
//  Exercise02ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 06/04/2022.
//

import UIKit

// MARK: Model
struct User {
    let names: String
    let avatar: String
}

final class Exercise02ViewController: UIViewController {
    
    // MARK: - Dummy Data
    var users: [User] = [
        User(names: "Alex", avatar: "ic-1"),
        User(names: "Daniel", avatar: "ic-2"),
        User(names: "Thomas", avatar: "ic-3"),
        User(names: "Jamie", avatar: "ic-4"),
        User(names: "Tyrone", avatar: "ic-5"),
        User(names: "Max", avatar: "ic-6"),
        User(names: "David", avatar: "ic-7"),
        User(names: "Kelvin", avatar: "ic-8"),
        User(names: "Joe", avatar: "ic-9")
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        view.backgroundColor = UIColor(red: 123/255, green: 124/255, blue: 125/255, alpha: 1.0)
        configView()
    }
    
    private func configView() {
        let screenWidht = UIScreen.main.bounds.width
        let space: CGFloat = 10
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 175
        var yUserView: CGFloat = 50
        var xUserView: CGFloat = space
        
        for index in 0..<users.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let userView = createUserView(frame: frame, index: index)
            view.addSubview(userView)
            
            // frame
            if xUserView + widthUserView > screenWidht - xUserView {
                // change x and y
                yUserView += heightUserView + space
                xUserView = space
            } else {
                xUserView += widthUserView + space
            }
        }
    }
    
    private func createUserView(frame: CGRect, index: Int) -> UIView {
        // Tao userView
        let userView = UIView(frame: frame)
        
        // them avatar
        let avatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 25))
        avatarImageView.image = UIImage(named: users[index].avatar)
        avatarImageView.contentMode = .scaleToFill
        userView.addSubview(avatarImageView)
        
        // Add name
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 150, width: userView.bounds.width, height: userView.bounds.height - avatarImageView.bounds.height))
        nameLabel.text = users[index].names
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .yellow
        userView.addSubview(nameLabel)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        button.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        button.addGestureRecognizer(tap)
        userView.addSubview(button)
        
        return userView
    }
    
    // Objc Tap
    @objc func buttonDidClick(sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("Name User is \(userName ?? "Tri")")
    }
}

