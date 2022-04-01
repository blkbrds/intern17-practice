//
//  HomeViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bài tập 1"
        addLotOfUser()
    }
    
    //MARK: - private functions
    private func addUser(name: String, imageStr: String, x: CGFloat, y: CGFloat) {
        // add user avatar
        let frame = CGRect(x: 20 + x, y: 100 + y, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(systemName: imageStr))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // add user name
        let username = UILabel(frame: CGRect(x: 20 + x, y: 200 + y, width: 100, height: 50))
        username.text = name
        username.backgroundColor = .lightGray
        username.textColor = .blue
        username.textAlignment = .center
        view.addSubview(username)
        
        // add button
        let button = UIButton(frame: CGRect(x: 20 + x, y: 100 + y, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func addLotOfUser() {
        let names: [String] = ["Thong", "Thanh", "Toan", "That", "Roi", "Ong", "Giao", "A",]
        let images: [String] = ["heart.fill", "heart.fill", "heart.fill", "heart.fill", "heart.fill", "heart.fill", "heart.fill", "heart.fill"]
        
        var horizonMove: CGFloat = 0
        var verticalMove: CGFloat = 0
        var countHorizon: Int = 0
        
        for index in 0..<names.count {
            addUser(name: names[index], imageStr: images[index], x: horizonMove, y: verticalMove)
            horizonMove += 120
            countHorizon += 1
            if countHorizon == 3 {
                verticalMove += 250
                countHorizon = 0
                horizonMove = 0
            }
        }
    }
    
    @objc private func buttonDidClick() {
        print("Button clicked")
    }
}
