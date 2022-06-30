//
//  BadgeNumberViewController.swift
//  CustomView
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/21/22.
//

import UIKit

final class BadgeNumberViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myViewEmail = Bundle.main.loadNibNamed("MyBadgeNumberView", owner: self, options: nil)?.first as? MyBadgeNumberView
        guard let viewEmail = myViewEmail else { return }
        viewEmail.frame = CGRect(x: 150, y: 160, width: 130, height: 520)
        viewEmail.number = 14
        viewEmail.valueTypeContentButton = .email
        viewEmail.typeBadgeLocation = .bottomRight
        view.addSubview(viewEmail)

        let myViewFriends = Bundle.main.loadNibNamed("MyBadgeNumberView", owner: self, options: nil)?.first as? MyBadgeNumberView
        guard let viewFriends = myViewFriends else { return }
        viewFriends.frame = CGRect(x: 150, y: 360, width: 130, height: 520)
        viewFriends.number = 2
        viewFriends.valueTypeContentButton = .friends
        viewFriends.typeBadgeLocation = .centerLeft
        view.addSubview(viewFriends)
        
        let myViewPhotos = Bundle.main.loadNibNamed("MyBadgeNumberView", owner: self, options: nil)?.first as? MyBadgeNumberView
        guard let viewPhotos = myViewPhotos else { return }
        viewPhotos.frame = CGRect(x: 150, y: 560, width: 130, height: 520)
        viewPhotos.number = 110
        viewPhotos.valueTypeContentButton = .photos
        viewPhotos.typeBadgeLocation = .bottomCenter
        view.addSubview(viewPhotos)
    }
}
