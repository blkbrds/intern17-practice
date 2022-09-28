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
    
    var viewModel: HeroCellViewModel? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        clipsToBounds = true
        avatarImageView.clipsToBounds = true
    }
    
    func updateCell() {
        guard let viewModel = viewModel else { return }
        avatarImageView.image = viewModel.avatar
        nameLabel.text = viewModel.name
        updateCell(status: viewModel.status)
    }

    func updateCell(status: Status) {
        nameLabel.isHidden = status == .small
        avatarImageView.layer.cornerRadius = status == .small ? 30 : 50
    }
    
}
