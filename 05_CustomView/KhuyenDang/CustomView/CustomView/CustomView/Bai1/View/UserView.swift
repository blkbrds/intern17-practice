//
//  UserView.swift
//  CustomView
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/20/22.
//

import UIKit

protocol UserViewDelegate: AnyObject {
    func didTaped(view: UserView, name: String)
}

final class UserView: UIView {

    weak var delegate: UserViewDelegate?

    let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 120, height: 40))

    override init(frame: CGRect) {
        super.init(frame: frame)

        let frame = CGRect(x: 0, y: 0, width: 120, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.jpeg"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        addSubview(userAvatar)
        
        // add user name
        userName.text = "name"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        userName.textAlignment = .center
        addSubview(userName)

        // add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 140))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(nameButtonTouchupUpInside), for: .touchUpInside)
        addSubview(button)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func nameButtonTouchupUpInside() {
        guard let delegate = delegate, let name = userName.text else {
            return
        }
        delegate.didTaped(view: self, name: name)
    }
}
