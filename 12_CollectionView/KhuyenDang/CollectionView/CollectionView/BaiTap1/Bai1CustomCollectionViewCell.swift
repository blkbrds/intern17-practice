//
//  Bai1CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/7/22.
//

import UIKit

final class Bai1CustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet private weak var valueLabel: UILabel!
    
    // MARK: - Method
    func updateCell(value: String) {
        valueLabel.text = value
    }
}
