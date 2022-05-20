//
//  NominationCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class NominationCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var nominationVideoImageView: UIImageView!
    @IBOutlet private weak var nominationVideoLabel: UILabel!

    // MARK: - Life cycle
    var viewModel: NominationCellViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Private funcitons
    private func updateView() {
        viewModel?.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.nominationVideoImageView.image = image
        })
        nominationVideoLabel.text = viewModel?.video.title
    }
}
