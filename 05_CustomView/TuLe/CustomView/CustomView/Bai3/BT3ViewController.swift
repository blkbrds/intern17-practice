//
//  BT3ViewController.swift
//  CustomView
//
//  Created by tu.le2 on 17/06/2022.
//

import UIKit

final class BT3ViewController: UIViewController {
    @IBOutlet private weak var emailButton: UIButton!
    @IBOutlet private weak var friendsButton: UIButton!
    @IBOutlet private weak var photoButton: UIButton!
    let badgeSize: CGFloat = 30
    let badgeTag = 9830384
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        emailButton.layer.cornerRadius = 10
        friendsButton.layer.cornerRadius = 10
        photoButton.layer.cornerRadius = 10
        showBadge(9990, 8 , 10)
    }
    
    
    private func configBadgeLabel(withCount count: Int) -> UILabel {
        let badgeCount = UILabel()
        badgeCount.layer.cornerRadius = 10
        badgeCount.backgroundColor = .systemRed
        badgeCount.textColor = .white
        badgeCount.clipsToBounds = true
        badgeCount.textAlignment = .center
        badgeCount.text = "\(count)"
        return badgeCount
    }
    
    func showBadge(_ email: Int, _ friends: Int, _ photo: Int) {
        let emailBadge = configBadgeLabel(withCount: email)
        let friendsBadge = configBadgeLabel(withCount: friends)
        let photoBadge = configBadgeLabel(withCount: photo)
        if email != 0 {
            emailBadge.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
            emailButton.addSubview(emailBadge)
            emailBadge.center = CGPoint(x: emailButton.bounds.width / 2, y: 0)
        }
        
        if friends != 0 {
            friendsBadge.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
            friendsButton.addSubview(friendsBadge)
            friendsBadge.center = CGPoint(x: 0, y: 0)
        }

        if photo != 0 {
            photoBadge.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
            photoButton.addSubview(photoBadge)
            photoBadge.center = CGPoint(x: emailButton.bounds.width / 2, y: 0)
        }
        
    }
    
    
}
