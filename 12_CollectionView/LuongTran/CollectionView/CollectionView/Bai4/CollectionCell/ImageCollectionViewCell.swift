//
//  ImageCollectionViewCell.swift
//  CollectionView
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var slideImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(image: UIImage) {
        slideImageView.image = image
    }

}
