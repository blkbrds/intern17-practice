//
//  CommentsTableViewCell.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/22/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class CommentsTableViewCell: UITableViewCell {

    @IBOutlet private weak var firstCommentLabel: UILabel!
    @IBOutlet private weak var secondCommentLabel: UILabel!

    var viewModel: CommentTableViewCellModel? {
        didSet {
            uploadUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func uploadUI() {
//        firstCommentLabel.text = viewModel?.getComments(with: 0)
    }
}
