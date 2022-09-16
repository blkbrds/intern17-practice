//
//  MyAvatar.swift
//  Protocol
//
//  Created by luong.tran on 13/09/2022.
//

import UIKit

protocol MyAvatarDelegate {
    func viewAction(view: MyAvatar, needPerform action: MyAvatar.Action)
}

final class MyAvatar: UIView {

    enum Action {
        case didTap(username: String)
    }

    var delegate: MyAvatarDelegate?

    var avatarImageView: UIImageView?
    var nameLabel: UILabel?
    var markButton: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue

        // add user avatar
        avatarImageView = UIImageView(image: UIImage(named: "no_avatar"))
        avatarImageView!.frame = CGRect(x: 0,
                                  y: 0,
                                  width: frame.size.width,
                                  height: frame.size.height*4/5)
        avatarImageView!.contentMode = .scaleAspectFill
        self.addSubview(avatarImageView!)

       // add user name
        nameLabel = UILabel(frame: CGRect(x: 0,
                                             y: frame.size.height*4/5,
                                             width: frame.size.width,
                                             height: frame.size.height/5))
        nameLabel!.text = "Fx Studio"
        nameLabel!.backgroundColor = .lightGray
        nameLabel!.textAlignment = .center
        nameLabel!.textColor = .blue
        self.addSubview(nameLabel!)

        // add button
        markButton = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: frame.size.width,
                                            height: frame.size.height))
        markButton!.backgroundColor = .clear
        markButton?.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.addSubview(markButton!)
    }

    @objc func tap(){
        guard let delegate = delegate, let name = nameLabel?.text else {
            return
        }
        delegate.viewAction(view: self, needPerform: .didTap(username: name))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
