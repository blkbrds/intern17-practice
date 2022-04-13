//
//  Exercise01ViewController.swift
//  CustomView
//
//  Created by tri.nguyen on 07/04/2022.
//

import UIKit

final class Exercise01ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Exercise01"
        // Add ScrollView
        
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        var contentSizeHeight: CGFloat = 0
                
        for i in 0..<10 {
            let y: CGFloat = DefineFrame.height * CGFloat(i)
            contentSizeHeight += DefineFrame.height
            // Load Nib
            for j in 0..<3 {
                let x: CGFloat = DefineFrame.width * CGFloat(j)
                guard let myAvatarView = Bundle.main.loadNibNamed("MyAvatarView", owner: self, options: nil)?.first as? MyAvatarView else { return }
                myAvatarView.frame = CGRect(x: x, y: y, width: DefineFrame.width, height: DefineFrame.height)
                myAvatarView.name = "Name \(i * 3 + j)"
                myAvatarView.avatar = "ic-7"
                myAvatarView.count = i * 3 + j
                myAvatarView.delegate = self
                
                self.containerView.addSubview(myAvatarView)
            }
        }
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: contentSizeHeight + CGFloat(400))
    }
}

// MARK: - Implement Protocol
// 4: Implement protocol
extension Exercise01ViewController: MyAvatarDelegate {
    func didTap(didTap with: MyAvatarView, countUser: Int) {
        print("CountUser: \(countUser)")
    }
}

// MARK: - Extention ViewControler
extension Exercise01ViewController {
    // Config Rect
    struct DefineFrame {
        static let width: CGFloat = UIScreen.main.bounds.width / 3
        static let height: CGFloat = UIScreen.main.bounds.width / 3
    }
}
