//
//  FeaturedCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class FeaturedCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var featuredVideoImageView: UIImageView!

    // MARK: - Properties
    var viewModel: FeatureCellViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private functions
    private func updateView() {
        viewModel?.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.featuredVideoImageView.image = image
        })
    }
}
