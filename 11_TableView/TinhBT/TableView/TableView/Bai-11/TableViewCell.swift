//
//  TableViewCell.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/24/22.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet weak var testlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
