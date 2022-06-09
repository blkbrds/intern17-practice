//
//  FavoriteCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

final class FavoriteCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var favoriteVideoImageView: UIImageView!
    @IBOutlet private weak var titleFavoriteVideoLabel: UILabel!

    // MARK: - Properties
    var viewModel: FavoriteCellViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private functions
    private func updateView() {
        viewModel?.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.favoriteVideoImageView.image = image
        })
        titleFavoriteVideoLabel.text = viewModel?.video.title
    }
}
