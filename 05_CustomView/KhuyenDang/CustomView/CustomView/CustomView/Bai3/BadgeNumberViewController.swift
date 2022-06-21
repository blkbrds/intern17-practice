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
        
        let myViewEmail = Bundle.main.loadNibNamed("MyBadgeNumberView", owner: self, options: nil)?.first as! MyBadgeNumberView
        myViewEmail.frame = CGRect(x: 150, y: 160, width: 130, height: 520)
        myViewEmail.number = 14
        myViewEmail.contentButton.setTitle("Emai", for: .normal)
        myViewEmail.contentButton.backgroundColor = .green
        myViewEmail.typeBadgeLocation = .bottomRight
        view.addSubview(myViewEmail)

        let myViewFriends = Bundle.main.loadNibNamed("MyBadgeNumberView", owner: self, options: nil)?.first as! MyBadgeNumberView
        myViewFriends.frame = CGRect(x: 150, y: 360, width: 130, height: 520)
        myViewFriends.number = 2
        myViewFriends.contentButton.setTitle("Friends", for: .normal)
        myViewFriends.contentButton.backgroundColor = .yellow
        view.addSubview(myViewFriends)
        
        let myViewPhotos = Bundle.main.loadNibNamed("MyBadgeNumberView", owner: self, options: nil)?.first as! MyBadgeNumberView
        myViewPhotos.frame = CGRect(x: 150, y: 560, width: 130, height: 520)
        myViewPhotos.number = 110
        myViewPhotos.contentButton.setTitle("Photos", for: .normal)
        myViewPhotos.contentButton.backgroundColor = .purple
        view.addSubview(myViewPhotos)
    }
}
