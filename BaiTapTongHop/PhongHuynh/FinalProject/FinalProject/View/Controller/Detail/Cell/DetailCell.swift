//
//  DetailCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class DetailCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var youtubeVideoImageView: UIImageView!
    @IBOutlet private weak var youtubeVideoLabel: UILabel!

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

    // MARK: - Private funcitons
    private func updateView() {
        viewModel?.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.youtubeVideoImageView.image = image
        })
        youtubeVideoLabel.text = viewModel?.video.title
    }
}
