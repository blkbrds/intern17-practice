//
//  HeroCollectionViewCell.swift
//  CollectionView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

final class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        clipsToBounds = true
        avatarImageView.clipsToBounds = true
    }
    
    func updateCell(avatar: UIImage, name: String, status: Status) {
        avatarImageView.image = avatar
        nameLabel.text = name
        updateCell(status: status)
    }

    func updateCell(status: Status) {
        switch status {
        case .standard:
            nameLabel.isHidden = false
            avatarImageView.layer.cornerRadius = 50
        case .small:
            nameLabel.isHidden = true
            avatarImageView.layer.cornerRadius = 30
        }
    }
    
}
