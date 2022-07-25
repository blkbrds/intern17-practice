//
//  BaiTap4CollectionViewCell.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/8/22.
//

import UIKit

final class BaiTap4CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func updateCell(avatar: String, name: String) {
        avatarImage.image = UIImage(named: avatar)
        nameLabel.text = name
    }
}
