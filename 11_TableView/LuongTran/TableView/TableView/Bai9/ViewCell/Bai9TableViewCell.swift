//
//  Bai9TableViewCell.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

protocol Bai9TableViewCellDelegate: AnyObject {
    func cell(cell: Bai9TableViewCell, needPerform action: Bai9TableViewCell.Action)
}

final class Bai9TableViewCell: UITableViewCell {

    enum Action {
        case didTap
    }
    
    weak var delegate: Bai9TableViewCellDelegate?
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(name: String, subTitle: String) {
        nameLabel.text = name
        subTitleLabel.text = subTitle
    }
    
    @IBAction private func tabButtonTouchUpInside(_ sender: Any) {
        guard let delegate = delegate else {
            return
        }
        delegate.cell(cell: self, needPerform: .didTap)
    }
    
}
