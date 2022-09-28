//
//  Bai1CollectionViewCell.swift
//  CollectionView
//
//  Created by luong.tran on 20/09/2022.
//

import UIKit

final class Bai1CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelNumber: UILabel!
    
    var viewModel: Bai1CellViewModel? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell() {
        guard let viewModel = viewModel else { return }
        labelNumber.text = "\(viewModel.number)"
    }

}
