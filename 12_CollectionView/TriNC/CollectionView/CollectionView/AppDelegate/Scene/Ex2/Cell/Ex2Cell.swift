//
//  Ex2Cell.swift
//  CollectionView
//
//  Created by tri.nguyen on 02/05/2022.
//

import UIKit

final class Ex2Cell: UICollectionViewCell {
    
    static let identifier = "Ex2Cell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        let images: [UIImage] = [
            UIImage(named: "ic-1"),
            UIImage(named: "ic-2"),
            UIImage(named: "ic-3"),
            UIImage(named: "ic-4"),
            UIImage(named: "ic-5")
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
