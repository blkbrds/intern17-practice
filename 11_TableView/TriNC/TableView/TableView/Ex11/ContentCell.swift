//
//  ContentCell.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class ContentCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var contentLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Function
    func config(text: String) {
        contentLabel.text = text
    }
}
