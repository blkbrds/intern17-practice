//
//  ContentCell.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class ContentCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentLabel.text = ""
    }
    
    func config(text: String) {
        contentLabel.text = text
    }
}
