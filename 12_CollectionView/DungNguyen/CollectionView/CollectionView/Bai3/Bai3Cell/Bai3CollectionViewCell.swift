//
//  Bai3CollectionViewCell.swift
//  CollectionView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/7/22.
//

import UIKit

final class Bai3CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImage: UIImageView!
    
    // MARK: - Function
    func updateCell(avatar: String, name: String) {
        avatarImage.image = UIImage(named: avatar)
        nameLabel.text = name
    }
}
