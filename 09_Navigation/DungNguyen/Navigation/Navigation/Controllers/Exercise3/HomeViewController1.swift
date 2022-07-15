//
//  HomeViewController1.swift
//  Navigation
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/30/22.
//

import UIKit

final class HomeViewController1: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    // MARK: - MARK: - Properties
    private var currentView: AvatarView?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.frame = UIScreen.main.bounds
        displayView()
        
    }
    
    // MARK: - Private methods
    private func displayView() {
        title = "Home"
        let distance: CGFloat = 10
        let widthView: CGFloat = CGFloat((UIScreen.main.bounds.width - 40) / 3)
        for index in 0..<100 {
            var x = distance * (CGFloat(index) + 1) + widthView * CGFloat(index)
            var y = distance
            if x >= UIScreen.main.bounds.width {
                let x1 = CGFloat(index % 3) * widthView
                let x2 = (CGFloat(index % 3) + 1) * distance
                x = x1 + x2
                y = distance * (CGFloat(index / 3) + 1) + 150 * CGFloat(index / 3)
            }
            let userView = AvatarView(frame: CGRect(x: x, y: y, width: widthView, height: 130), name: "Name \(index + 1)", index: index, image: UIImage(named: "avatar.jepg")!)
            userView.delegate = self
            scrollView.addSubview(userView)
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: y + 150 + 50)
        }
    }

}

// MARK: - Extensions
extension HomeViewController1: UserViewDelegate {
    func userView(userView: AvatarView, didSelect index: Int, name: String, avatarImage: UIImage){
        let vc = ProlifeViewController()
        currentView = userView
        vc.name = name
        vc.avatar = avatarImage
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController1: ProlifeViewControllerDelegate {
    func controller(viewController: ProlifeViewController, username: String) {
        currentView?.userName.text = username
    }
}
