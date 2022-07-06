//
//  Bai3CollectionViewCell.swift
//  collectionView
//
//  Created by Tinh Bui T. VN.Danang on 5/27/22.
//

import UIKit

final class Bai3CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
        avatarImageView.clipsToBounds = true
    }

    // MARK: - Functions
    func updateCell(avatar: UIImage, name: String, status: Status) {
        avatarImageView.image = avatar
        nameLabel.text = name
        updateCell(status: status)
    }

    func updateCell(status: Status) {
        switch status {
        case .standard:
            avatarImageView.layer.cornerRadius = 65
        case .small:
        avatarImageView.layer.cornerRadius = 30
        }
    }
}
