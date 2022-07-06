//
//  CommentCell.swift
//  TableView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/6/22.
//

import UIKit

final class CommentCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var commentLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Function
    func updateCommentTableCell(comment: String) {
        commentLabel.text = comment
    }
}
