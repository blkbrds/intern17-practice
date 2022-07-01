//
//  UserView.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/30/22.
//

import UIKit

protocol UserViewDelegate: AnyObject {
    func didTaped(view: UserView, name: String, index: Int, image: UIImage)
}

final class UserView: UIView {
    
    //MARK: Properties
    var index: Int = 0
    var name: String = "" {
        didSet {
            userName.text = name
        }
    }
    var image: UIImage?
    weak var delegate: UserViewDelegate?
    let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 120, height: 40))
    
    //MARK: init
    convenience init(frame: CGRect, name: String, index: Int, image: UIImage) {
        self.init(frame: frame)
        self.name = name
        self.index = index
        self.image = image
        configUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //MARK: - Private method
    private func configUI() {
        let frame = CGRect(x: 0, y: 0, width: 120, height: 100)
        let userAvatar = UIImageView()
        userAvatar.image = image
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        addSubview(userAvatar)
        
        userName.text = name
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        userName.textAlignment = .center
        addSubview(userName)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 140))
        button.tag = index
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(nameButtonTouchupInside(sender:)), for: .touchUpInside)
        addSubview(button)
    }
    
    // MARK: -
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Objc
    @objc private func nameButtonTouchupInside(sender: UIButton) {
        guard let image = image else { return }
        delegate?.didTaped(view: self, name: name, index: index, image: image)
    }
}
