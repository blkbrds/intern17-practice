//
//  DetailCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/13/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class DetailCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var youtubeImageView: UIImageView!
    @IBOutlet private weak var youtubeLabel: UILabel!

    var viewModel: DetailCellViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Private functions
    private func updateView() {
        youtubeLabel.text = viewModel?.video.title
        Networking.shared().downloadImage(url: viewModel?.video.imageURL ?? "") { (image) in
            self.youtubeImageView.image = image
        }
    }
}
