//
//  CollectionCell.swift
//  CollectionView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/7/22.
//

import UIKit

final class CollectionCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
