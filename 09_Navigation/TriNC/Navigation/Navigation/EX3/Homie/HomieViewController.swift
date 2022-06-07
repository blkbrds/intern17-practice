//
//  HomieViewController.swift
//  Navigation
//
//  Created by tri.nguyen on 20/04/2022.
//

import UIKit

final class HomieViewController: UIViewController {
    
    // MARK: - Scroll View
    var scrollView: UIScrollView = UIScrollView()
    
    // MARK: - Properties
    private var viewModel = HomieViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserView()
    }
    
    // MARK: Private Functions
    private func createUserView() {
        title = "Home"
        
        let screenSize = UIScreen.main.bounds
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        let space: CGFloat = 10
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 175
        var yView: CGFloat = 10
        var xView: CGFloat = (screenSize.width - widthUserView * 3 - (2 * space)) / 2
        let numberRow = viewModel.users.count / 3
        let heightScrollOne = heightUserView * CGFloat(numberRow) + space * CGFloat((numberRow - 1))
        let heightScroll1 = heightUserView * (CGFloat(numberRow) + 1) + space * CGFloat((numberRow - 1))
        
        if viewModel.users.count % 3 == 0 {
            scrollView.contentSize = CGSize(width: screenSize.width, height: heightScrollOne)
        } else {
            scrollView.contentSize = CGSize(width: screenSize.width, height: heightScroll1)
        }
        
        view.addSubview(scrollView)
        
        for index in 0..<viewModel.users.count {
            let frame = CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView)
            let avatarView = AvatarView(frame: frame, index: index)
            avatarView.usernameLabel.text = viewModel.users[index].name
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
        case .tap(userNameLabel: let username, userImage: let userImage, let index):
            let vc = ProfileViewController()
            vc.delegate = self
            vc.username = username
            vc.index = index
            vc.userImage = userImage
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomieViewController: ProfileViewControllerDelegate {
    
    func controller(_ controller: ProfileViewController, needsPerform action: ProfileViewController.Action) {
        switch action {
        case .changeNameUser(username: let username, index: let index):
            viewModel.users[index].name = username
            scrollView.subviews.forEach {
                $0.removeFromSuperview()
            }
            createUserView()
        }
    }
}
