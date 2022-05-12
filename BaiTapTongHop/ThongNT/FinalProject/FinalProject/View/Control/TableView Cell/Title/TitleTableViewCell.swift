//
//  TitleTableViewCell.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/22/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class TitleTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!

    var isLiked: ((Bool) -> Void)?
    var viewModel: TitleTableViewCellModel? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateUI() {
        titleLabel.text = viewModel?.getTitle()
        guard let viewModel = viewModel else { return }
        if viewModel.getStateOfVideo() {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        }
    }

    private func like() {
        guard let viewModel = viewModel else { return }
        viewModel.like()
    }

    @IBAction private func likeVideo(_ sender: UIButton) {
        like()
        updateUI()
    }
}
