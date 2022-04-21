//
//  HomieViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class HomieViewController: UIViewController {
    
    // MARK: - Dummy Data
    var users: [User] = [
        User(name: "user1", nameImage: "ic-user"),
        User(name: "user2", nameImage: "ic-user"),
        User(name: "user3", nameImage: "ic-user"),
        User(name: "user4", nameImage: "ic-user"),
        User(name: "user5", nameImage: "ic-user"),
        User(name: "user6", nameImage: "ic-user"),
        User(name: "user7", nameImage: "ic-user"),
        User(name: "user8", nameImage: "ic-user"),
        User(name: "user9", nameImage: "ic-user"),
        User(name: "user10", nameImage: "ic-user"),
        User(name: "user11", nameImage: "ic-user"),
        User(name: "user12", nameImage: "ic-user"),
        User(name: "user13", nameImage: "ic-user"),
        User(name: "user14", nameImage: "ic-user"),
        User(name: "user15", nameImage: "ic-user"),
        User(name: "user16", nameImage: "ic-user"),
        User(name: "user17", nameImage: "ic-user"),
        User(name: "user18", nameImage: "ic-user"),
        User(name: "user19", nameImage: "ic-user"),
        User(name: "user20", nameImage: "ic-user"),
        User(name: "user21", nameImage: "ic-user"),
        User(name: "user22", nameImage: "ic-user"),
        User(name: "user23", nameImage: "ic-user"),
        User(name: "user24", nameImage: "ic-user"),
        User(name: "user25", nameImage: "ic-user"),
        User(name: "user26", nameImage: "ic-user"),
        User(name: "user27", nameImage: "ic-user"),
        User(name: "user28", nameImage: "ic-user"),
        User(name: "user29", nameImage: "ic-user"),
        User(name: "user30", nameImage: "ic-user")
    ]
    
    var scrollView: UIScrollView = UIScrollView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserView()
    }
    
    // MARK: Private Functions
    private func createUserView() {
        title = "Home"
        navigationController?.navigationBar.barTintColor = .cyan
        
        let screenSize = UIScreen.main.bounds
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 10, width: screenSize.width, height: screenSize.height))
        let space: CGFloat = 10
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 175
        var yView: CGFloat = 10
        var xView: CGFloat = (screenSize.width - widthUserView * 3 - (2 * space)) / 2
        let numberRow = users.count / 3
        let heightScrollOne = heightUserView * CGFloat(numberRow) + space * CGFloat((numberRow - 1))
        let heightScroll1 = heightUserView * (CGFloat(numberRow) + 1) + space * CGFloat((numberRow - 1))
        
        if users.count % 3 == 0 {
            scrollView.contentSize = CGSize(width: screenSize.width, height: heightScrollOne)
        } else {
            scrollView.contentSize = CGSize(width: screenSize.width, height: heightScroll1)
        }
        
        view.addSubview(scrollView)
        
        for index in 0..<users.count {
            let frame = CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView)
            let avatarView = AvatarView(frame: frame, index: index)
            avatarView.usernameLabel.text = users[index].name
            avatarView.delegate = self
            scrollView.addSubview(avatarView)
            
            if xView + widthUserView > screenSize.width - xView {
                yView += heightUserView + space
                xView = (screenSize.width - widthUserView * 3 - 2 * space) / 2
            } else {
                xView += widthUserView + space
            }
        }
    }
}

// MARK: - Extention
extension HomieViewController: AvatarViewDelegate {
    func view(_ view: AvatarView, needsPerform action: AvatarView.Action) {
        switch action {
        case .tap(nameLabel: let username, nameImage: let userImage, let index):
            let vc = ProfileViewController()
            vc.delegate = self
            vc.username = username
            vc.index = index
            vc.userImage = userImage
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomieViewController: ProfileViewControllerDelegate {
    func controller(_ controller: ProfileViewController, needsPerform action: ProfileViewController.Action) {
        switch action {
        case .changeNameUser(username: let username, index: let index):
            users[index].name = username
            scrollView.subviews.forEach {
                $0.removeFromSuperview()
            }
            createUserView()
        }
    }
}
