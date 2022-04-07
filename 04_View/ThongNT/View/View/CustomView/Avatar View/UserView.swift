//
//  UserView.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/3/22.
//

import UIKit

protocol UserViewDelegate {
    func didTap(view: UserView, count: Int)
}

final class UserView: UIView {
    
    private var count: Int = 0
    var delegate: UserViewDelegate?
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userImage: UIImageView!

    @IBAction private func tapButton(_ sender: UIButton) {
        count += 1
        userNameLabel.text = "\(count)"
        guard let delegate = delegate else { return }
        delegate.didTap(view: self, count: count)
    }
    
    func setDataForUser(user: UserInfo) {
        userNameLabel.text = user.username
        userImage.image = UIImage(named: user.userImage)
        userImage.contentMode = .scaleToFill
    }
}
