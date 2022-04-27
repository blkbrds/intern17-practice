//
//  CommentsTableViewCell.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/22/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class CommentsTableViewCell: UITableViewCell {

    // MARK: - IBOulet private properties
    @IBOutlet private weak var firstCommentLabel: UILabel!
    @IBOutlet private weak var secondCommentLabel: UILabel!
    @IBOutlet private weak var firstAuthorImage: UIImageView!
    @IBOutlet private weak var secondAuthorImage: UIImageView!

    var viewModel: CommentTableViewCellModel? {
        didSet {
            uploadUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        firstAuthorImage.layer.cornerRadius = firstAuthorImage.bounds.height / 2
        secondAuthorImage.layer.cornerRadius = secondAuthorImage.bounds.height / 2
    }

    private func uploadUI() {
        firstCommentLabel.text = viewModel?.getComments(with: 0)
        guard let urlString1 = viewModel?.getAuthorImageURL(with: 0),
              let urlString2 = viewModel?.getAuthorImageURL(with: 1) else { return }
        let url1 = URL(string: urlString1)
        let url2 = URL(string: urlString2)
        firstAuthorImage.sd_setImage(with: url1, completed: nil)
        secondCommentLabel.text = viewModel?.getComments(with: 1)
        secondAuthorImage.sd_setImage(with: url2, completed: nil)
    }
}
