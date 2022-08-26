//
//  Bai1ViewController.swift
//  CustomView
//
//  Created by luong.tran on 23/08/2022.
//

import UIKit

class Bai1ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configUserUI()
    }
    
    func configUserUI(){

        let width: CGFloat = CGFloat((UIScreen.main.bounds.width - 60) / 3)
        let height: CGFloat = CGFloat((UIScreen.main.bounds.width) / 3)
        let space = 15

        for i in 0..<30{
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
        print(scrollView.contentSize)
    }

}

// Bước 4: Implement protocol
extension Bai1ViewController: MyAvatarDelegate{
    func didTap(view: MyAvatar, userName: String) {
        print(userName)
    }
}
