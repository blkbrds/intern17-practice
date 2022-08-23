//
//  Bai1ViewController.swift
//  View
//
//  Created by luong.tran on 19/08/2022.
//

import UIKit

class Bai1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(x: 30, y: 70, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(systemName: "person.fill"))
        userAvatar.backgroundColor = .systemGray3
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleAspectFit
        view.addSubview(userAvatar)
        
        let labelName = UILabel(frame: CGRect(x: 30, y: 170, width: 100, height: 30))
        labelName.text = "Person"
        labelName.textColor = .white
        labelName.backgroundColor = .systemTeal
        labelName.textAlignment = .center
        view.addSubview(labelName)
        
    }

}
