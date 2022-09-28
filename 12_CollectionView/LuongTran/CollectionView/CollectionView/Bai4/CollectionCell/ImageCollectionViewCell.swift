//
//  ImageCollectionViewCell.swift
//  CollectionView
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var slideImageView: UIImageView!
    
    var viewModel: ImageCellViewModel? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell() {
        guard let viewModel = viewModel else { return }
        slideImageView.image = viewModel.imageSlide
    }

}
