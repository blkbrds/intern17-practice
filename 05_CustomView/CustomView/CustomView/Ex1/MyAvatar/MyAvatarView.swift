//
//  MyAvatarView.swift
//  CustomView
//
//  Created by tri.nguyen on 07/04/2022.
//

import Foundation
import UIKit

// 2: Tạo Protocol MyDelegateAvatar
protocol MyAvatarDelegate {
    func didTap(didTap with: MyAvatarView, countUser: Int)
}

// 1: Tạo Class MyAvatar
final class MyAvatarView: UIView {
    
    // MARK: - Properties
    var delegate: MyAvatarDelegate?
    var count: Int = 0
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var avatar: String = "" {
        didSet {
            avatarImageView.image = UIImage(named: avatar)
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var myButton: UIButton!
    
    // MARK: - IBActions
    @IBAction private func myActionTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            // callback
            delegate.didTap(didTap: self, countUser: count)
        }
    }
}


