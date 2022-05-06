//
//  Ex2Cell.swift
//  CollectionView
//
//  Created by tri.nguyen on 06/05/2022.
//

import UIKit

final class Ex2Cell: UICollectionViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var numberLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        numberLabel.textAlignment = .center
    }

}
