//
//  HeroCell.swift
//  CollectionView
//
//  Created by tri.nguyen on 03/05/2022.
//

import UIKit

final class HeroCell: UICollectionViewCell {

    // MARK: - Life cycle
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 22
        clipsToBounds = true
        avatarImageView.layer.cornerRadius = 12
        avatarImageView.clipsToBounds = true
    }
    
    // MARK: - Public Function
    func updateCell(avatar: UIImage, name: String) {
        avatarImageView.image = avatar
        nameLabel.text = name
    }
}
