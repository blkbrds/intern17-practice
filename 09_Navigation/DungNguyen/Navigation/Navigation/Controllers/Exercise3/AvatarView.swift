//
//  AvatarView1.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/30/22.
//

import UIKit

// MARK: - Protocols
protocol UserViewDelegate {
    func userView(userView: AvatarView, didSelect index: Int, name: String, avatarImage: UIImage)
}

final class AvatarView: UIView {

    // MARK: - MARK: - Properties
    var image: UIImage?
    var userName: UILabel = UILabel()
    var delegate: UserViewDelegate?
    var name: String = "n/a"
    var index: Int = 0
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect , name: String, index: Int, image: UIImage) {
        self.init(frame: frame)
        self.name = name
        self.index = index
        self.image = image
        configView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private methods
    private func configView() {
        // Add iser avatar
        let userView = UIView(frame: frame)
        let frame = CGRect(x: 0, y: 10, width: userView.bounds.width, height: userView.bounds.height)
        let userAvatar = UIImageView()
        userAvatar.image = image
        userAvatar.frame = CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 15)
        userAvatar.contentMode = .scaleToFill
        addSubview(userAvatar)
        // Add user name
        userName = UILabel(frame: CGRect(x: 0, y: userView.bounds.height - 15 , width: userView.bounds.width, height: frame.height - 100))
        userName.text = name
        userName.backgroundColor = .lightGray
        userName.textAlignment = .center
        userName.textColor = .blue
        addSubview(userName)
        // Add button
        let button = UIButton(frame: frame)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        addSubview(button)
    }
    
    // MARK: - Objcs
    @objc func buttonDidClick() {
        guard let image = image else { return }
        delegate?.userView(userView: self, didSelect: index, name: name, avatarImage: image)
    }
}

