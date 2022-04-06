//
//  AvatarViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/1/22.
//

import UIKit

struct UserInfo {
    var username: String
    var userImage: String
}

final class AvatarViewController: UIViewController {
    
    //MARK: - IBOutlet private variables
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    
    //MARK: - Private Properties
    private let usersInfo: [UserInfo] = [UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong", userImage: "MonkeyImage")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        addUsers()
    }
    
    private func addUser(user: UserInfo, x: CGFloat, y: CGFloat) {
        guard let avatarView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UserView else { return }
        avatarView.frame = CGRect(x: 150 + x, y: 150 + y, width: 100, height: 150)
        avatarView.setDataForUser(user: user)
        avatarView.delegate = self
        contentView.addSubview(avatarView)
    }
    
    
    private func addUsers() {
        var horizonMove: CGFloat = 0
        var verticalMove: CGFloat = 0
        var countHorizon: Int = 0
        
        usersInfo.forEach { (user) in
            addUser(user: user, x: horizonMove, y: verticalMove)
            horizonMove += 120
            countHorizon += 1
            if countHorizon == 3 {
                verticalMove += 250
                countHorizon = 0
                horizonMove = 0
            }
        }
    }
}

extension AvatarViewController: UserViewDelegate {
    func didTap(view: UserView, count: Int) {
        print("Count: \(count)")
    }
}
