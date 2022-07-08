//
//  BaiTap3CollectionViewCell.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/7/22.
//

import UIKit

final class BaiTap3CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Method
    func updateCell(name: String, avatar: String) {
        nameLabel.text = name
        avatarImage.image = UIImage(named: avatar)
    }
}
