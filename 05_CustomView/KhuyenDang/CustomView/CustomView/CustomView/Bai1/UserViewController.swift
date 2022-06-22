//
//  UserViewController.swift
//  CustomView
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/20/22.
//

import UIKit

final class UserViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        var xUser: CGFloat = 15
        var yUser: CGFloat = 50
        let widthUser: CGFloat = CGFloat((UIScreen.main.bounds.width - 60) / 3) 
        for _ in 0...9 {
            for _ in 0...2 {
                let userView = UserView(frame: CGRect(x: xUser, y: yUser, width: widthUser, height: 240))
                userView.delegate = self
                view.addSubview(userView)
                scrollView.addSubview(userView)
                scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: yUser + 130 )
                xUser += 15 + widthUser
            }
            xUser = 15
            yUser += 100 + 40 + 15
        }
    }
}

extension UserViewController: UserViewDelegate {
    func didTaped(view: UserView, name: String) {
        print(name)
    }
}
