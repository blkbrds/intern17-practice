//
//  Avatar.swift
//  BTNavigation
//
//  Created by Tuan Tran V. VN.Danang on 5/23/22.
//

import Foundation
import UIKit

final class Avatar: UIView {
    //MARK: -IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBAction private func didTap(_ sender: Any) {
        delegate?.avatar(self, didSelect: nameLabel.text ?? "name 0")
    }
    weak var delegate: AvatarDelegate?
}
