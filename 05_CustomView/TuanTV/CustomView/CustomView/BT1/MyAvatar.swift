//
//  MyAvatar.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/6/22.
//

import Foundation
import UIKit

class MyAvatar: UIView {
        
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imvAvatar: UIImageView!
    @IBAction func didTap(_ sender: Any) {
        print("haha")
        delegate?.myAvatar(self, didSelect: 10)
    }
    weak var delegate: MyAvatarDelegate?
}

