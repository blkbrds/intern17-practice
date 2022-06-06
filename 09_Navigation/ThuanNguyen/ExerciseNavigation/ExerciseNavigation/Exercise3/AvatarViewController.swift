//
//  AvatarViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 18/05/2022.
//

import UIKit

class AvatarViewController: UIViewController {
    
    private var avatarViews: [MyAvatar] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
        title = "Home"
    }
    
    private func createScrollView() {
        let scrollView: UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height ))
        view.addSubview(scrollView)
        let totalWidth: CGFloat = Config.screenSize.width
        scrollView.isScrollEnabled = true
        let contentView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.bounds.size.width, height: view.bounds.size.height))
        contentView.backgroundColor = .red
        
        for (index,name) in Config.names.enumerated() {
            let myAvatar = MyAvatar(frame: CGRect(x: Config.x, y: Config.y, width: Config.imgW, height: Config.imgh))
            avatarViews.append(myAvatar)
            avatarViews[index].tag = index
            avatarViews[index].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tap(_:))))
            avatarViews[index].nameLabel?.text = name
            contentView.addSubview(avatarViews[index])
            
            if Config.x + (Config.imgW + Config.space) * 2 > Config.screenSize.width {
                Config.x = 50
                Config.y += Config.imgh + Config.space //+ (navigationController?.navigationBar.frame.height)! // a += b ~ a = a + b
            } else {
                Config.x += Config.space + Config.imgW
            }
        }
        scrollView.addSubview(contentView)
        scrollView.contentSize = CGSize(width: totalWidth , height: Config.y)
        contentView.frame.size.height = Config.y
    }
    
    @objc private func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        let vc = ProfileViewController()
        guard let tag = gestureRecognizer.view?.tag else { return }
        vc.nameuser = Config.names[tag]
        vc.userIndex = tag
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AvatarViewController {
    struct Config {
        static let names: [String] = ["name1", "name2", "name3", "name4", "name5", "name6", "name7", "name8", "name9","name10", "name11", "name12","name13", "name14", "name15", "name16", "name17", "name18", "name19", "name20", "name21", "name22", "name23", "name24","name25", "name26", "name27","name28", "name29", "name30"]
        static var x: CGFloat = 50
        static var y: CGFloat = 0
        static let imgW: CGFloat = 100
        static let imgh: CGFloat = 125
        static let space: CGFloat = 10
        static let screenSize: CGSize = UIScreen.main.bounds.size
        static let abc: CGFloat = 100
    }
}

extension AvatarViewController: ProfileControllerDelegate {
    func updateController(view: ProfileViewController, needsPerform actions: ProfileViewController.Action) {
        switch actions {
        case.tap(let userName, let userIndex):
            avatarViews[userIndex].nameLabel?.text = userName
        }
        }
    }
