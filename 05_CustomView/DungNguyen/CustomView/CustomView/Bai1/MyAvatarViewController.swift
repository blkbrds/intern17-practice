//
//  MyAvatarViewController.swift
//  CustomView_bai1
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/16/22.
//

import UIKit

final class MyAvatarViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        scrollView.frame = UIScreen.main.bounds
        displayView()
    }
    
    // MARK: - Private methods
    private func displayView() {
        let distance: CGFloat = 10
        let widthView: CGFloat = CGFloat((UIScreen.main.bounds.width - 40) / 3)
        for index in 0..<100 {
            var x = distance * (CGFloat(index) + 1) + widthView * CGFloat(index)
            var y = distance
            if x >= UIScreen.main.bounds.width {
                let x1 = CGFloat(index % 3) * widthView
                let x2 = (CGFloat(index % 3) + 1) * distance
                x = x1 + x2
                y = distance * (CGFloat(index / 3) + 1) + 130 * CGFloat(index / 3)
            }
            let userView = MyAvatar(frame: CGRect(x: x, y: y, width: widthView, height: 130), name: "Name \(index + 1)", index: index)
            userView.delegate = self
            scrollView.addSubview(userView)
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: y + 130 + 50)
        }
    }
}

extension MyAvatarViewController: UserViewDelegate {
    func userView(userView: MyAvatar, didSelect index: Int){
        print("Select userview with index \(index + 1)")
    }
}
