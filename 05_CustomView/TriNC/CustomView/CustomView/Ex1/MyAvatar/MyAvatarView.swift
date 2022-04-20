//
//  MyAvatarView.swift
//  CustomView
//
//  Created by tri.nguyen on 07/04/2022.
//

import Foundation
import UIKit

// 2: Tạo Protocol MyDelegateAvatar
protocol MyAvatarViewDelegate {
    func view(_ view: MyAvatarView, needsPerform action: MyAvatarView.Action)
}

// 1: Tạo Class MyAvatar
final class MyAvatarView: UIView {
    
    // MARK: - Properties
    var delegate: MyAvatarViewDelegate?
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
            delegate.view(self, needsPerform: .tap(countUser: count))
        }
    }
}

// MARK: - Enum
extension MyAvatarView {
    enum Action {
        case tap(countUser: Int)
    }
}

