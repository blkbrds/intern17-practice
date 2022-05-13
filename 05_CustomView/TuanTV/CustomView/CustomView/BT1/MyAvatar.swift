//
//  MyAvatar.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/6/22.
//

import Foundation
import UIKit

class MyAvatar: UIView {
        
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBAction func didTap(_ sender: Any) {
        delegate?.myAvatar(self, didSelect: nameLabel.text ?? "name 0")
    }
    weak var delegate: MyAvatarDelegate?
}

