//
//  HomeViewController.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/6/22.
//

import UIKit

final class HomeViewController: UIViewController {
    private let spaceAvatar: Int = 10

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        for i in 1...30 {
            let x: Int = 20 + (100 + spaceAvatar) * ((i - 1) % 3)
            let y: Int = 0 + (120 + spaceAvatar) * Int((i - 1) / 3)
            let myAvatar = Bundle.main.loadNibNamed("MyAvatar", owner: self, options: nil)?[0] as? MyAvatar
            myAvatar?.delegate = self
            myAvatar?.frame = CGRect(x: x, y: y, width: 100, height: 120)
            myAvatar?.nameLabel.text = "Name \(i)"
            myAvatar?.avatarImageView.image = UIImage(named: "user")
            scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
            scrollView.addSubview(myAvatar!)
           }
       }
}

protocol  MyAvatarDelegate: class {
    func myAvatar (_ myAvatar: MyAvatar, didSelect name: String)
}

extension HomeViewController: MyAvatarDelegate {
    func myAvatar(_ myAvatar: MyAvatar, didSelect name: String) {
        print("Selected my avatar with \(name)")
    }
}
