//
//  MyAvatar.swift
//  CustomView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit

// MARK: - Protocol


class MyAvatarView: UIView {
    
    // MARK: - Computed Properties
    
    private lazy var myAvatarImageView: UIImageView = {
        let myAvatar = UIImageView()
        myAvatar.image = UIImage(named: "ic-user")
        return myAvatar
    }()
    
    private lazy var myNameLabel: UILabel = {
       let myLabel = UILabel()
        myLabel.textAlignment = .center
        myLabel.textColor = .orange
        myLabel.font = UIFont(name: "myname 1", size: 22)
       return myLabel
    }()
    
    private lazy var myButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapButtonTouchUpInside), for: .touchUpInside)
        return button
    }()
    
    // Objc
    @objc func tapButtonTouchUpInside() {
        print("tap tap tap")
    }
}
