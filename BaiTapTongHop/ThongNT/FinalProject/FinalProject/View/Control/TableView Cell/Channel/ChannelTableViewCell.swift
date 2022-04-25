//
//  ChannelTableViewCell.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/22/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class ChannelTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var channelImageView: UIImageView!

    var title: String?
    var viewModel: ChannelTableViewCellModel? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateUI() {
        guard let chanelTitle = viewModel?.getChannelTitle(),
             let channelThumbnailString = viewModel?.getChannelId() else { return }
        titleLabel.text = chanelTitle
        let url = URL(string: channelThumbnailString)
        channelImageView.sd_setImage(with: url, completed: nil)
    }
}
