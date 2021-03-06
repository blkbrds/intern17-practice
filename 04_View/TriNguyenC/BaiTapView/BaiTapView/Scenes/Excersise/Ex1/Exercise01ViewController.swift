//
//  Exercise01ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 06/04/2022.
//

import UIKit

final class Exercise01ViewController: UIViewController {
    
    // MARK: - Computed Properties
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic-user")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Tri"
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
        self.title = "Exercise01"
        view.backgroundColor = UIColor(red: 11/255, green: 111/255, blue: 1111/255, alpha: 1.0)
        
        // Set Frame For Object
        avatarImageView.frame = Define.frameAvatar
        nameLabel.frame = Define.frameNameLabel
        markButton.frame = Define.frameButton
        
        // Add SubView
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(markButton)
    }
}

// MARK: - Extention Define Frame
extension Exercise01ViewController {
    struct Define {
        static var frameAvatar = CGRect(x: 50, y: 100, width: 100, height: 100)
        static var frameNameLabel = CGRect(x: 50, y: 200, width: 100, height: 25)
        static var frameButton = CGRect(x: 50, y: 100, width: 100, height: 125)
    }
}


