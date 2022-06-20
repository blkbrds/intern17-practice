//
//  UserViewController.swift
//  CustomView
//
//  Created by tu.le2 on 15/06/2022.
//

import UIKit

final class UserViewController: UIViewController {
    
    private let screenSize = UIScreen.main.bounds
    let spaceX: Int = 10
    var widthFrame: CGFloat = (UIScreen.main.bounds.width - 40)/3
    var count: Int = 1
    var userNumber: Int = 31
    var userNameLabel: UILabel?
    
    let userScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        for i in 0...userNumber {
            let xFrame = (spaceX * (i % 3 + 1) + ((i % 3)) * Int(widthFrame))
            let yFrame = 145 * (count - 1) + spaceX * (count - 1)
            if xFrame < Int(UIScreen.main.bounds.width) {
                let myAvatar = MyAvatarView(frame: CGRect(x: xFrame, y: yFrame, width: Int(widthFrame), height: 145))
                myAvatar.delegate = self
                userScrollView.addSubview(myAvatar)
            }
            if i % 3 == 2 {
                count += 1
            }
        }
        let heightContentScrollView: CGFloat = CGFloat(145 * (userNumber / 3 + 1) + (userNumber / 3 + 1) * spaceX)
        userScrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        userScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: heightContentScrollView)
        view.addSubview(userScrollView)
    }
}

extension UserViewController: UserViewDelegate {
    func didTaped(view: MyAvatarView, count: Int) {
        view.nameLabel?.text = "\(count)"
    }
}
