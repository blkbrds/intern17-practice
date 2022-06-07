//
//  NavigationBarViewController.swift
//  DemoNavigition
//
//  Created by thuan.nguyen on 17/05/2022.
//

import UIKit

final class NavigationBarViewController: UIViewController {
    enum NaviStatus {
        case changeImage, changeColorAndTincolor, addSearchBar, addBarButtonItem, changeImageBarButtonItem
        func setTitle() -> String {
            switch self {
            case .changeImage:
                return "Gradient NavigationBar"
            case .changeColorAndTincolor:
                return "News Feed"
            case .addSearchBar:
                return ""
            case .addBarButtonItem:
                return ""
            case .changeImageBarButtonItem:
                return "Bar Button Test"
            }
        }
    }
     
    private var naviStatus: NaviStatus = .changeImageBarButtonItem
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch naviStatus {
        case .changeImage:
            changeImageNavigitionbar(titleNavi: naviStatus.setTitle())
        case .changeColorAndTincolor:
            changeColorAndTincolorNavigitionbar(titleNavi: naviStatus.setTitle())
        case .addSearchBar:
            addSearchNavigitionBar()
        case .addBarButtonItem:
            addBarNavigitonbar()
        case .changeImageBarButtonItem:
            changeImageButtonItemNavigitonbar(titleNavi: naviStatus.setTitle())
        }
        
}
    private func changeImageNavigitionbar(titleNavi: String) {
       title = titleNavi
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundImage = UIImage(named: "image11")
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.yellow]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }else{
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "image11"), for: .default)
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
        }
    }
    private func changeColorAndTincolorNavigitionbar(titleNavi: String) {
        title = titleNavi
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemBlue
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }else{
            self.navigationController?.navigationBar.barTintColor = .blue
    }
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .search)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .bookmarks)
        navigationItem.rightBarButtonItem?.tintColor = .black
}
    private func addSearchNavigitionBar() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemGray4
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }else{
            self.navigationController?.navigationBar.barTintColor = .systemGray4
    }
        let searchbar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 280, height: 60))
        searchbar.placeholder = " "
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchbar)
        let rightButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = .purple
        let frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50)
        let segmentView = UISegmentedControl(frame: frame)
        segmentView.backgroundColor = .systemPink
        segmentView.insertSegment(withTitle: "option 1", at: 0, animated: true)
        segmentView.insertSegment(withTitle: "option 2", at: 1, animated: true)
        segmentView.selectedSegmentIndex = 0
        view.addSubview(segmentView)
        
    }
    private func addBarNavigitonbar() {
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        let leftButton1 = UIBarButtonItem(title: "Mid 1", style: .plain, target: self, action: nil)
        let leftButton2 = UIBarButtonItem(title: "Mid 2", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [leftButton1, leftButton2]
        self.navigationItem.leftItemsSupplementBackButton = true
        navigationItem.prompt = NSLocalizedString("1:12 PM", comment: "1")
    }
    private func changeImageButtonItemNavigitonbar(titleNavi: String) {
        title = titleNavi
        navigationController?.navigationBar.backgroundColor = .systemGray4
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "avatar1"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        subView.addSubview(button)
        let barButton = UIBarButtonItem(customView: subView)
        navigationItem.rightBarButtonItem = barButton
    }
}
