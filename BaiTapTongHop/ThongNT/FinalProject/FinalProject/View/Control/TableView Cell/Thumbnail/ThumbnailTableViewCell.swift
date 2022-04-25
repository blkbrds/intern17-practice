//
//  ThumbnailTableViewCell.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/21/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import SDWebImage

final class ThumbnailTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabeL: UILabel!
    @IBOutlet private weak var imageOfVideo: UIImageView!
    @IBOutlet private weak var publishedAt: UILabel!

    var viewModel: ThumbnailTableViewCellModel? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    private func updateUI() {
        titleLabeL.text = viewModel?.snippet?.title
        publishedAt.text = viewModel?.snippet?.publishedAt
        guard let imageString = viewModel?.snippet?.imageString else { return }
        let imageURL = URL(string: imageString)
        imageOfVideo.sd_setImage(with: imageURL, completed: nil)
    }
}
