//
//  Bai1CollectionViewCell.swift
//  CollectionView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/7/22.
//

import UIKit

final class Bai1CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOulet
    @IBOutlet private weak var numberLabel: UILabel!
    
    // MARK: - Function
    func updateCell(number: Int) {
        numberLabel.text = "\(number)"
    }
}
