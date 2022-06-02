//
//  MyAvatar.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/11/22.
//
import UIKit
import Foundation

// MARK: - MyAvatarDelegate
protocol MyAvatarDelegate: class {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int)
}

final class MyAvatar: UIView {
    
    // MARK: - Property
    var userAvatar: String = ""
    var userName: String = "" {
        didSet {
            setData()
        }
    }
    var id: Int = 0
    weak var delegate: MyAvatarDelegate?
    var button: UIButton?
    var userNameLabel = UILabel()
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height * 4/5)
        let userAvatarImage = UIImageView(image: UIImage(named: "avt"))
        userAvatarImage.frame = frame
        userAvatarImage.contentMode = .scaleAspectFill
        addSubview(userAvatarImage)
        
        userNameLabel = UILabel(frame: CGRect(x: 0, y: frame.size.height * 4/5, width: frame.size.height, height: frame.size.height/5))
        userNameLabel.textAlignment = .center
        userNameLabel.backgroundColor = .gray
        userNameLabel.textColor = .white
        addSubview(userNameLabel)
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        button?.backgroundColor = .clear
        button?.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        addSubview(button!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private function
    @objc private func buttonDidClick() {
        delegate?.myAvatar(self, didSelect: id)
    }
    
    func updateData(name: String) {
        userNameLabel.text = name
    }
    
    private func setData() {
        userNameLabel.text = userName
    }
}
