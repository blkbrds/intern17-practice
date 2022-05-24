//
//  BT2ControllerViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/22/22.
//

import UIKit

final class BT2ViewController: UIViewController {
    
    var nameList: [String] = []
    var avatarList: [UIImage?] = []
    var widthView: CGFloat = 0
    var heightView: CGFloat = 0
    var horizontalAvatarSpace: CGFloat = 0
    var verticalAvatarSpace: CGFloat = 0
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    lazy var viewUsers: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        setupView()
    }
    
    private func prepareData() {
        widthView = view.frame.width
        heightView = view.frame.height
        horizontalAvatarSpace = 10
        verticalAvatarSpace = 10
        for i in 1...9 {
            nameList.append("Name \(i)")
            avatarList.append(UIImage(named: "icon_user"))
        }
    }
    
    private func setupView() {
        let frameView = CGRect(x: 10, y: 100, width: widthView - 20, height: 410)
        viewUsers.frame = frameView
        view.addSubview(viewUsers)
        x = 0
        y = 0
        let widthViewUsers = viewUsers.frame.width
        let widthViewUser = (widthViewUsers - 2 * horizontalAvatarSpace) / 3
        for i in 0...2 {
            
            for j in 0...2 {
                let viewUser = UIView(frame: CGRect(x: x, y: y, width: widthViewUser, height: 130))
                viewUser.backgroundColor = .red
                viewUsers.addSubview(viewUser)
                
                let frameAvatar = CGRect(x: 0, y: 0, width: widthViewUser, height: 100)
                let imvAvatar = UIImageView(image: avatarList[3 * i + j])
                imvAvatar.frame = frameAvatar
                imvAvatar.contentMode = .scaleToFill
            
                let lbName = UILabel(frame: CGRect(x: 0, y: 100, width: widthViewUser, height: 30))
                lbName.text = nameList[3 * i + j ]
                lbName.textAlignment = .center
                lbName.backgroundColor = .blue
                viewUser.addSubview(imvAvatar)
                viewUser.addSubview(lbName)
                viewUsers.addSubview(viewUser)
    
                x = x + widthViewUser + horizontalAvatarSpace
          
            }
            x = 0
            y = y + 130 + verticalAvatarSpace
        }
    }
}
