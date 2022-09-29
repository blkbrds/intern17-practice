//
//  Bai11TableViewCell.swift
//  TableView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

final class Bai11TableViewCell: UITableViewCell {

    @IBOutlet private weak var lblContent: UILabel!
    
    var viewModel: Bai11CellViewModel? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell() {
        guard let viewModel = viewModel else { return }
        lblContent.text = viewModel.content
    }
    
}
