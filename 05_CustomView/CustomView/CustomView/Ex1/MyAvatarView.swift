//
//  MyAvatar.swift
//  CustomView
//
//  Created by tri.nguyen on 04/04/2022.
//

import UIKit

// MARK: - Protocol


class MyAvatarView: UIView {
    
    // MARK: - Properties
    
    private lazy var avatarImage: UIImage = {
       let avatar = UIImage()
       return avatar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
