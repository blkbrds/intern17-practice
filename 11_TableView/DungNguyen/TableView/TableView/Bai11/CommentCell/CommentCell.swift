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
    
    // MARK: - Function
    func updateCommentTableCell(comment: String) {
        commentLabel.text = comment
    }
}
