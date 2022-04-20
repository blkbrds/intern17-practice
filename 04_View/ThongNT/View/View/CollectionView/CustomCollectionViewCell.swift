//
//  CustomCollectionViewCell.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/15/22.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configLabel()
    }
    
    private func configLabel() {
        imageView.backgroundColor = .clear
        imageView.contentMode = .center
    }
}
