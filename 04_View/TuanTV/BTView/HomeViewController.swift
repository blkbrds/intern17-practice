//
//  HomeViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/21/22.
//

import Foundation
import UIKit

final class HomeViewController : UIViewController {
    
    lazy var imvAvatar: UIImageView = {
        let imv = UIImageView()
        imv.backgroundColor = .yellow
        imv.contentMode = .scaleToFill
        return imv
    }()
    
    lazy var lbName: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .blue
        lb.textAlignment = .center
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let user1 = User(avatar: UIImage(named: "UserImage"), name: "Tuan")
        // add avatar view
        let frameAvatar = CGRect(x: 50, y: 100, width: 100, height: 100)
        imvAvatar.frame = frameAvatar
        imvAvatar.image = user1.avatar
        view.addSubview(imvAvatar)
        // add user name
        let frameLbName = CGRect(x: 50, y: 200, width: 100, height: 30)
        lbName.frame = frameLbName
        lbName.text = user1.name
        view.addSubview(lbName)
    }
}

final class User {
    var avatar: UIImage?
    var name: String
    init(avatar: UIImage?, name: String) {
        self.avatar = avatar
        self.name = name
    }
}



