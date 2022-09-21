//
//  Bai1CollectionViewCell.swift
//  CollectionView
//
//  Created by luong.tran on 20/09/2022.
//

import UIKit

class Bai1CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(number: String) {
        labelNumber.text = number
    }

}
