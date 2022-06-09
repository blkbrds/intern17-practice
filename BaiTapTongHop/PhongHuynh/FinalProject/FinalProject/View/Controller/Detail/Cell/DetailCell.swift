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

    // MARK: - Properties
    var viewModel: DetailCellViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private functions
    private func updateView() {
        viewModel?.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.youtubeVideoImageView.image = image
        })
        youtubeVideoLabel.text = viewModel?.video.title
    }
}
