//
//  NameCell.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class NameCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
