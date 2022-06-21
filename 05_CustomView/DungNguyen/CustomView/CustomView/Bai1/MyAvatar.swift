//
//  MyAvatar.swift
//  CustomView_bai1
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/16/22.
//

import UIKit

protocol UserViewDelegate {
    func userView(userView: MyAvatar, didSelect index: Int)
}

final class MyAvatar: UIView {
    
    // MARK: - MARK: - Properties
    var userAvatar: UIImageView?
    var userName: UILabel?
    var delegate: UserViewDelegate?
    var name: String = "n/a"
    var index: Int = 0
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect , name: String, index: Int) {
        self.init(frame: frame)
        self.name = name
        self.index = index
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configView() {
        // Add iser avatar
        let userView = UIView(frame: frame)
        let frame = CGRect(x: 0, y: 0, width: userView.frame.size.width, height: userView.frame.size.height * 4 / 5)
        userAvatar = UIImageView(image: UIImage(named: "monkey.png"))
        userAvatar?.frame = frame
        userAvatar?.contentMode = .scaleToFill
        addSubview(userAvatar!)
        
        // Add user name
        userName = UILabel(frame: CGRect(x: 0, y: userView.frame.size.height * 4 / 5, width: userView.bounds.width, height: userView.frame.size.height / 5))
        userName?.text = name
        userName?.backgroundColor = .lightGray
        userName?.textAlignment = .center
        userName?.textColor = .blue
        addSubview(userName!)
        
        // Add button
        let button = UIButton(frame: frame)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        addSubview(button)
    }
    
    // MARK: - Objcs
    @objc func buttonDidClick() {
        delegate?.userView(userView: self, didSelect: index)
    }
}
