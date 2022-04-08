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
    private let usersInfo: [UserInfo] = [UserInfo(username: "Thong1", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong2", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong3", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong4", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong5", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong6", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong7", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong8", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong9", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong10", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong11", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong12", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong13", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong14", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong15", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong16", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong17", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong18", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong19", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong20", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong21", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong22", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong23", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong24", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong25", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong26", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong27", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong28", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong29", userImage: "MonkeyImage"),
                                         UserInfo(username: "Thong30", userImage: "MonkeyImage")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        addUsers()
    }
    
    private func addUser(user: UserInfo, index: Int, x: CGFloat, y: CGFloat) {
        guard let avatarView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UserView else { return }
        avatarView.frame.origin = CGPoint(x: 20 + x, y: 20 + y)
        avatarView.setDataForUser(user: user)
        avatarView.delegate = self
        avatarView.tag = index
        contentView.addSubview(avatarView)
    }
    
    private func addUsers() {
        var horizonMove: CGFloat = 0
        var verticalMove: CGFloat = 0
        var countHorizon: Int = 0
        
        usersInfo.enumerated().forEach { (index, user) in
            addUser(user: user, index: index, x: horizonMove, y: verticalMove)
            horizonMove += 130
            countHorizon += 1
            if countHorizon == 3 {
                verticalMove += 230
                countHorizon = 0
                horizonMove = 0
            }
        }
    }
}

// MARK: - Extension of Delegates
extension AvatarViewController: UserViewDelegate {
    func didTap(view: UserView, userInfo: UserInfo) {
        let profileVC = ProfileViewController(user: userInfo, tag: view.tag)
        profileVC.delegate = self
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

extension AvatarViewController: ProfileViewControllerDelegate {
    func changeName(on view: ProfileViewController, with userInfo: UserInfo, tag: Int) {
        guard let viewChange = contentView.subviews.first(where: { $0.tag == tag} ) as? UserView else { return }
        viewChange.setDataForUser(user: userInfo)
        viewChange.layoutIfNeeded()
    }
}
