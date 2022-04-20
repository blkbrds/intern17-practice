//
//  BadgeNumberView.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/4/22.
//

import UIKit

protocol BadgeNumberViewDatasource {
    func getNumberOfNotifi(in view: BadgeNumberView) -> Int
}

final class BadgeNumberView: UIView {
    
    //MARK: - IBOutlet variable
    @IBOutlet private weak var numberLabel: UILabel!
    
    var datasource: BadgeNumberViewDatasource?
    
    //MARK: - Override functions
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    //MARK: - Internal function
    func setupBadgeNumber() {
        guard let value = datasource?.getNumberOfNotifi(in: self) else { return }
        setNumberForLabel(with: value)
    }
    
    //MARK: - Private functions
    private func setupUI() {
        numberLabel.clipsToBounds = true
        numberLabel.layer.cornerRadius = 10
        numberLabel.layer.masksToBounds = true
    }
    
    private func setNumberForLabel(with value: Int) {
        numberLabel.isHidden = value == 0
        if value > 99 {
            numberLabel.text = "99+"
            return
        }
        numberLabel.text = String(value)
    }
}
