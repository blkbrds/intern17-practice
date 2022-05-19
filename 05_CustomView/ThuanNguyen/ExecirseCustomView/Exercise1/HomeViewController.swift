//
//  HomeViewController.swift
//  ViduCustomview
//
//  Created by thuan.nguyen on 25/04/2022.
//

import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
        
    }

    private func createScrollView() {
        let scrollView: UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height ))
        view.addSubview(scrollView)
        let totalWidth: CGFloat = Config.screenSize.width
        scrollView.isScrollEnabled = true
        let contentView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height))
        scrollView.addSubview(contentView)

        for name in Config.names {
            let myAvatar = MyView(frame: CGRect(x: Config.x, y: Config.y, width: Config.imgW, height: Config.imgh))
            myAvatar.nameLabel?.text = name
            contentView.addSubview(myAvatar)

            if Config.x + (Config.imgW + Config.space) * 2 > Config.screenSize.width {
                Config.x = 50
                Config.y += Config.y + Config.imgh + Config.space
            } else {
                Config.x += Config.space + Config.imgW
            }

        }
        scrollView.contentSize = CGSize(width: totalWidth , height: Config.y)
    }
    
}

extension HomeViewController {

    struct Config {
        static let names: [String] = ["name1", "name2", "name3", "name4", "name5", "name6", "name7", "name8", "name9","name10", "name11", "name12","name13", "name14", "name15", "name16", "name17", "name18", "name19", "name20", "name21", "name22", "name23", "name24","name25", "name26", "name27","name28", "name29", "name30"]
        static var x: CGFloat = 50
        static var y: CGFloat = 100
        static let imgW: CGFloat = 100
        static let imgh: CGFloat = 125
        static let space: CGFloat = 10
        static let screenSize: CGSize = UIScreen.main.bounds.size
    }
}

