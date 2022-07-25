//
//  CustomLabelTableViewCell.swift
//  TableView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/6/22.
//

import UIKit

final class CustomLabelTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Method
    func updateTableCell(value: String) {
        valueLabel.text = value
    }

    // MARK: - Override func
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
