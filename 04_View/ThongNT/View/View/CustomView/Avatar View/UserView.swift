//
//  UserView.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/3/22.
//

import UIKit

protocol UserViewDelegate: AnyObject {
    func didTap(view: UserView, userInfo: UserInfo)
}

final class UserView: UIView {
    
    private var count: Int = 0
    private var userInfo: UserInfo = UserInfo(username: "", userImage: "")
    weak var delegate: UserViewDelegate?
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userImage: UIImageView!
    
    @IBAction private func tapButton(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.didTap(view: self, userInfo: userInfo)
    }
    
    func setDataForUser(user: UserInfo) {
        userInfo = user
        userNameLabel.text = user.username
        userImage.image = UIImage(named: user.userImage)
        userImage.contentMode = .scaleToFill
    }
}
