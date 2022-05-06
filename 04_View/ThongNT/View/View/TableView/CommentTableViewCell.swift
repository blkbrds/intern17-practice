//
//  CommentTableViewCell.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/12/22.
//

import UIKit

final class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var commentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configLabel() {
        commentLabel.textAlignment = .left
        commentLabel.font = UIFont.boldSystemFont(ofSize: 20)
        commentLabel.textAlignment = .justified
    }

    func updateTableCell(with comment: String) {
        commentLabel.text = comment
    }
}
