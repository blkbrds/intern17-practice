//
//  HomeViewController.swift
//  Protocol
//
//  Created by luong.tran on 13/09/2022.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Define.titleBar
        configUI()
    }
    
    private func configUI() {
        let width: CGFloat = CGFloat((UIScreen.main.bounds.width - 60) / 3)
        let height: CGFloat = CGFloat((UIScreen.main.bounds.width) / 3)
        let space = 15
        
        for i in 0..<30 {
            let x1: CGFloat = CGFloat(space * (i + 1))
            let x2: CGFloat = width * CGFloat(i)
            var x: CGFloat = x1 + x2
            var y: CGFloat = 15
            if x >= UIScreen.main.bounds.width {
                let x1 = CGFloat(i % 3) * width
                let x2 = CGFloat(((i % 3) + 1) ) * CGFloat(space)
                x = x1 + x2
                y = CGFloat(y) * (CGFloat(Float(i / 3)) + 1) + height * CGFloat(i / 3)
            }
            
            let myView = MyAvatar(frame: CGRect(x: x, y: y, width: width, height: height))
            myView.nameLabel?.text = "Name \(i)"
            myView.avatarImageView?.image = UIImage(systemName: "person.fill")
            myView.delegate = self
            contentView.addSubview(myView)
        }
        scrollView.contentSize = CGSize(width: contentView.bounds.size.width, height: contentView.bounds.size.height)
    }

}

extension HomeViewController: MyAvatarDelegate {
    func view(view: MyAvatar, needPerform action: MyAvatar.Action) {
        switch action {
        case .didTap(username: let username):
            let prifileVC = EditViewController()
            prifileVC.delegate = self
            prifileVC.userText = username
            navigationController?.pushViewController(prifileVC, animated: true)
         }
     }
 }

extension HomeViewController: EditViewControllerDelegate {
    func vc(vc: EditViewController, needPerform action: EditViewController.Action) {
        switch action {
        case .updateUsername(userName: let username):
            print(username)
        }
    }
}

extension HomeViewController {
    private struct Define {
        static let titleBar = "Home"
    }
}
