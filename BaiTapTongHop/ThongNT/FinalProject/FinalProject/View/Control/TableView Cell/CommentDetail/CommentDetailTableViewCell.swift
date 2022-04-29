//
//  CommentDetailTableViewCell.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/29/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class CommentDetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var authorImageView: UIImageView!
    @IBOutlet private weak var authorCommentLabel: UILabel!
    @IBOutlet private weak var authorNameLabel: UILabel!

    var viewModel: CommentDetaiTableViewCellModel? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: Private functions
    private func setupUI() {
        authorImageView.layer.cornerRadius = authorImageView.bounds.height / 2
    }

    private func updateUI() {
        guard let viewModel = viewModel else { return }
        let imageUrl = viewModel.getAuthorImageUrl()
        authorImageView.sd_setImage(with: imageUrl, completed: nil)
        authorCommentLabel.text = viewModel.getAuthorComment()
        authorNameLabel.text = viewModel.getAuthorName()
    }
}
