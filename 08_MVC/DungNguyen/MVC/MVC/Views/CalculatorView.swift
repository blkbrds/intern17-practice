//
//  CalculatorView.swift
//  MVC
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/28/22.
//

import UIKit

final class CalculatorView: UIView {

    @IBOutlet private var collectionButton: [UIButton]!

    private func configUI() {
        for i in collectionButton {
            i.layer.borderWidth = 0.5
            i.layer.borderColor = UIColor.gray.cgColor
        }
    }
}
