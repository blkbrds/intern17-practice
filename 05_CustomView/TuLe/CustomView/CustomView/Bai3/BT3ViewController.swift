//
//  BT3ViewController.swift
//  CustomView
//
//  Created by tu.le2 on 17/06/2022.
//

import UIKit

struct Define {
    static let cornerRadius: CGFloat = 10
    static let x: CGFloat = 0
    static let y: CGFloat = 0
    static let width: CGFloat = 50
    static let height: CGFloat = 20
}

final class BT3ViewController: UIViewController {
    @IBOutlet private weak var emailButton: UIButton!
    @IBOutlet private weak var friendsButton: UIButton!
    @IBOutlet private weak var photoButton: UIButton!
    let badgeSize: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        emailButton.layer.cornerRadius = Define.cornerRadius
        friendsButton.layer.cornerRadius = Define.cornerRadius
        photoButton.layer.cornerRadius = Define.cornerRadius
        showBadge(9990, 8 , 10)
    }
    
    
    private func configBadgeLabel(_ count: Int) -> UILabel {
        let badgeCount = UILabel()
        badgeCount.layer.cornerRadius = Define.cornerRadius
        badgeCount.backgroundColor = .systemRed
        badgeCount.textColor = .white
        badgeCount.clipsToBounds = true
        badgeCount.textAlignment = .center
        badgeCount.text = "\(count)"
        return badgeCount
    }
    
    func showBadge(_ email: Int, _ friends: Int, _ photo: Int) {
        let emailBadge = configBadgeLabel(email)
        let friendsBadge = configBadgeLabel(friends)
        let photoBadge = configBadgeLabel(photo)
        if email != 0 {
            emailBadge.frame = CGRect(x: Define.x, y: Define.y, width: Define.width, height: Define.height)
            emailButton.addSubview(emailBadge)
            emailBadge.center = CGPoint(x: emailButton.bounds.width, y: 0)
        }
        
        if friends != 0 {
            friendsBadge.frame = CGRect(x: Define.x, y: Define.y, width: Define.width, height: Define.height)
            friendsButton.addSubview(friendsBadge)
            friendsBadge.center = CGPoint(x: 0, y: 0)
        }

        if photo != 0 {
            photoBadge.frame = CGRect(x: Define.x, y: Define.y, width: Define.width, height: Define.height)
            photoButton.addSubview(photoBadge)
            photoBadge.center = CGPoint(x: emailButton.bounds.width / 2, y: 0)
        }
        
    }
    
    
}
