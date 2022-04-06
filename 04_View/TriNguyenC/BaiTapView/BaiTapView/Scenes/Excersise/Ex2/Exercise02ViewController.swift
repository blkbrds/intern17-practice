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

class Exercise02ViewController: UIViewController {
    
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
    
    // MARK: - Properties
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic-5")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
     private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tyrone Ming"
        label.textColor = .white
        label.backgroundColor = UIColor(red: 66/255, green: 77/255, blue: 88/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var markButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        self.title = "Exercise02"
        view.backgroundColor = UIColor(red: 123/255, green: 124/255, blue: 125/255, alpha: 1.0)
        
        // Frame
        avatarImageView.frame = Configuration.frameAvatar
        nameLabel.frame = Configuration.frameNameLabel
        markButton.frame = Configuration.frameButton
        
        // Add subview
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(markButton)
    }
    
    private func createMoreUserView() {
        let screenWidth = UIScreen.main.bounds.width
    }
}

// MARK: - Extention Configuration
extension Exercise02ViewController {
    struct Configuration  {
        static var frameAvatar = CGRect(x: 40, y: 100, width: 100, height: 100)
        static var frameNameLabel = CGRect(x: 40, y: 200, width: 100, height: 25)
        static var frameButton = CGRect(x: 40, y: 100, width: 100, height: 125)
    }
}

