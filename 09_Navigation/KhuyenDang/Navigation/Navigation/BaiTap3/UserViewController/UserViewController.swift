//
//  UserViewController.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/30/22.
//

import UIKit

final class UserViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet private weak var scrollView: UIScrollView!
    
    //MARK: - Properties
    var currentView: UserView?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Private methods
    private func configUI(){
        title = "Home"
        let distance: CGFloat = 10
        let widthView: CGFloat = CGFloat((UIScreen.main.bounds.width - 40) / 3)
        for index in 0..<100 {
            var x = distance * (CGFloat(index) + 1) + widthView * CGFloat(index)
            var y = distance
            if x >= UIScreen.main.bounds.width {
                let x1 = CGFloat(index % 3) * widthView
                let x2 = (CGFloat(index % 3) + 1) * distance
                x = x1 + x2
                y = distance * (CGFloat(index / 3) + 1) + 150 * CGFloat(index / 3)
            }
            let userView = UserView(frame: CGRect(x: x, y: y, width: widthView, height: 140), name: "Name \(index + 1)", index: index, image: UIImage(named: "avatar-cute")!)
            userView.delegate = self
            scrollView.addSubview(userView)
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: y + 130 + 50)
        }
    }
}

//MARK: - Extensions
extension UserViewController: UserViewDelegate {
    func didTaped(_ controller: UserView, needPerformAction action: UserView.Action) {
        switch action {
        case .passProfileUser(name: let name, index: let index, image: let image):
                let profileViewController = ProfileViewController()
                profileViewController.delegate = self
                currentView = controller
                profileViewController.username = name
                profileViewController.image = image
                profileViewController.index = index
                navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
}

extension UserViewController: ProfileViewControllerDelegate {
    func controller(_ controller: ProfileViewController, needPerformAction action: ProfileViewController.Action) {
        switch action {
        case .updateProfile(username: let username):
            guard let currentView = currentView else { return }
            currentView.name = username
        }
    }
}

