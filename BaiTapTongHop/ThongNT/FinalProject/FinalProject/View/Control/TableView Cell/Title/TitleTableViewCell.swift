//
//  TitleTableViewCell.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/22/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var likeButotn: UIButton!

    var isLiked: (() -> Void)?
    var viewModel: TitleTableViewCellModel?

    var title: String? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateUI() {
        guard let title = title else { return }
        titleLabel.text = title
    }

    private func like(status: Bool) {
        if status {
            likeButotn.image(for: .selected)
        }
    }

    @IBAction private func likeVideo(_ sender: UIButton) {
        like(status: true)
        isLiked?()
    }
}
