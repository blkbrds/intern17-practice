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

    // MARK: - IBOutlet private properties
    @IBOutlet private weak var titleLabeL: UILabel!
    @IBOutlet private weak var imageOfVideo: UIImageView!
    @IBOutlet private weak var publishedAt: UILabel!

    var viewModel: ThumbnailTableViewCellModel? {
        didSet {
            updateUI()
        }
    }

    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageOfVideo.image = nil
    }

    // MARK: - Private functions
    private func setupUI() {
        imageOfVideo.clipsToBounds = true
        imageOfVideo.layer.cornerRadius = 5
    }

    private func updateUI() {
        titleLabeL.text = viewModel?.getTitle()
        publishedAt.text = viewModel?.getPublishDate()
        guard let imageString = viewModel?.snippet?.imageString else {
            imageOfVideo.image = #imageLiteral(resourceName: "DefaultImage2")
            return
        }
        let imageURL = URL(string: imageString)
        imageOfVideo.sd_setImage(with: imageURL,
                                 placeholderImage: #imageLiteral(resourceName: "YoutubeImage"),
                                 context: nil)
    }
}
