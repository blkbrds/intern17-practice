//
//  Bai11TableViewCell.swift
//  TableView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

final class Bai11TableViewCell: UITableViewCell {

    @IBOutlet private weak var lblContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCell(content: String) {
        lblContent.text = content
    }
    
}
