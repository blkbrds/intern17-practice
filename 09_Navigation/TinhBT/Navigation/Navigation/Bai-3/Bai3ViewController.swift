//
//  Bai3ViewController.swift
//  Navigation
//
//  Created by Tinh Bui T. VN.Danang on 5/10/22.
//

import UIKit

final class Bai3ViewController: UIViewController {
    
    // MARK: - Property
    private let screenSize = UIScreen.main.bounds
    var xo: CGFloat = (UIScreen.main.bounds.width - 300)/4
    var yo: CGFloat = 30
    let imageWidth: CGFloat = 100
    let imageHeight: CGFloat = 125
    var space: CGFloat = (UIScreen.main.bounds.width - 300)/4
    let numberItem: Int = 30
    var views: [MyAvatar] = []
    var id: Int = 0
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        self.view.addSubview(scrollView)
        setupUI()
        title = "Home"
    }
    
    // MARK: - Private function
    private func setupUI() {
        for i in 0..<numberItem {
            let viewInHome = MyAvatar(frame: CGRect(x: xo, y: yo, width: imageWidth, height: imageHeight))
            viewInHome.userName = "name \(i + 1)"
            viewInHome.delegate = self
            viewInHome.id = i
            scrollView.addSubview(viewInHome)
            if xo + imageWidth > screenSize.width - xo {
                xo = (UIScreen.main.bounds.width - 300)/4
                yo += imageHeight
            } else {
                xo += CGFloat(space) + imageWidth
            }
            views.append(viewInHome)
        }
        
        let numberItemInScreenVertical = numberItem / 3 + numberItem % 3
        let totalImageHeaight = imageHeight * CGFloat(numberItemInScreenVertical)
        let totalSpaceInScreenVertical = space * (CGFloat(numberItemInScreenVertical) - 1)
        let totalHeight = totalImageHeaight + totalSpaceInScreenVertical
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: totalHeight)
    }
}

// MARK: - MyAvatarDelegate
extension Bai3ViewController: MyAvatarDelegate {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int) {
        id = index
        let name = views[index].userName
        let proFile = ProfileViewController(with: name)
        proFile.delegate = self
        self.navigationController?.pushViewController(proFile, animated: true)
    }
}

// MARK: - ProfileViewDelegate
extension Bai3ViewController: ProfileViewDelegate {
    func view(view: ProfileViewController, needPerform action: ProfileViewController.Action) {
        switch action {
        case .sendData(let value):
            views[id].updateData(name: value)
        }
    }
}
