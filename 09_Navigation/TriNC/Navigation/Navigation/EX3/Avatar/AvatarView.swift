//
//  AvatarView.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import Foundation
import UIKit

// MARK: - Protocol
protocol AvatarViewDelegate: class {
    func view(_ view: AvatarView, needsPerform action: AvatarView.Action)
}

final class AvatarView: UIView {
    
    // MARK: - Properties
    weak var delegate: AvatarViewDelegate?
    var name: String = ""
    var index: Int = 0
    var userAvatarImageView: UIImageView = UIImageView()
    var usernameLabel: UILabel = UILabel()
    var button: UIButton = UIButton()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        // add avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatarImageView.frame = frame
        userAvatarImageView.image = UIImage(named: "ic-user")
        userAvatarImageView.contentMode = .scaleAspectFit
        addSubview(userAvatarImageView)
        
        // add label
        usernameLabel.frame = CGRect(x: 0, y: 100, width: 100, height: 25)
        usernameLabel.text = name
        usernameLabel.textAlignment = .center
        usernameLabel.textColor = .blue
        usernameLabel.backgroundColor = .lightGray
        addSubview(usernameLabel)
        
        // add button
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 125)
        button.backgroundColor = .clear
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didClickButton))
        button.addGestureRecognizer(tapGesture)
        addSubview(button)
    }
    
    // MARK: - Initialize
    convenience init(frame: CGRect, index: Int = 0, name: String = "") {
        self.init(frame: frame)
        self.index = index
    }
    
    // MARK: - Objc
    @objc private func didClickButton() {
        guard let delegate = delegate else { return }
        delegate.view(self, needsPerform: .tap(userNameLabel: usernameLabel.text ?? "", userImage: userAvatarImageView.image, index: index))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extention
extension AvatarView {
    // MARK: - Enum
    enum Action {
        case tap(userNameLabel: String, userImage: UIImage?, index: Int)
    }
}
