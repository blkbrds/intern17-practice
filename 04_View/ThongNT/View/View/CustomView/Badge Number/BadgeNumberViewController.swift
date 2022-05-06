//
//  BadgeNumberViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/1/22.
//

import UIKit

enum BadgeNumberPosition {
    case topLeft
    case topRight
    case topCenter
    case centerLeft
    case centerRight
    case bottomLeft
    case bottomRight
    case bottomCenter
}

final class BadgeNumberViewController: UIViewController {
    
    //MARK: - IBOulet variables
    @IBOutlet private weak var emailButton: UIButton!
    @IBOutlet private weak var friendsButton: UIButton!
    @IBOutlet private weak var photosButton: UIButton!
    
    private var numberOfNotifi: Int = 0
    private var badgeView: BadgeNumberView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        view.subviews
            .compactMap { $0 as? UIButton }
            .forEach { configButton($0) }
        
        addBadgeNumberView(mount: 50, position: .topRight,for: emailButton)
        addBadgeNumberView(mount: 100, position: .centerLeft, for: friendsButton)
        addBadgeNumberView(mount: 2, position: .bottomLeft, for: photosButton)
    }
    
    private func configButton(_ button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = false
    }
    
    private func addBadgeNumberView(mount: Int,
                                    position badge: BadgeNumberPosition,
                                    for button: UIButton) {
        guard let badgeView = Bundle.main.loadNibNamed("BadgeNumberView", owner: self, options: nil)?.first as?
                BadgeNumberView else { return }
        self.badgeView = badgeView
        
        let badgeSize = CGSize(width: 50, height: 25)
        var badgePointCenter: CGPoint = .zero
        self.badgeView?.datasource = self
        
        switch badge {
        case .topRight:
            badgePointCenter = CGPoint(x: button.bounds.maxX, y: button.bounds.minY)
        case .topCenter:
            badgePointCenter = CGPoint(x: button.bounds.midX, y: button.bounds.minY)
        case .topLeft:
            badgePointCenter = CGPoint(x: button.bounds.minX, y: button.bounds.minY)
        case .centerLeft:
            badgePointCenter = CGPoint(x: button.bounds.minX, y: button.bounds.midY)
        case .centerRight:
            badgePointCenter = CGPoint(x: button.bounds.maxX, y: button.bounds.midY)
        case .bottomLeft:
            badgePointCenter = CGPoint(x: button.bounds.minX, y: button.bounds.maxY)
        case .bottomCenter:
            badgePointCenter = CGPoint(x: button.bounds.midX, y: button.bounds.maxY)
        case .bottomRight:
            badgePointCenter = CGPoint(x: button.bounds.maxX, y: button.bounds.maxY)
        }
        self.badgeView?.frame.size = badgeSize
        self.badgeView?.center = badgePointCenter
        numberOfNotifi = mount
        self.badgeView?.setupBadgeNumber()
        button.addSubview(badgeView)
    }
}

//MARK: - Extension of delegate
extension BadgeNumberViewController: BadgeNumberViewDatasource {
    func getNumberOfNotifi(in view: BadgeNumberView) -> Int {
        return numberOfNotifi
    }
}
