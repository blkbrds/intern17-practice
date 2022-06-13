//
//  FavoriteCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

// MARK: - FavoriteCellDelegate
protocol FavoriteCellDelegate: class {

    func cell(cell: FavoriteCell, needPerfom actions: FavoriteCell.Action)
}

final class FavoriteCell: UITableViewCell {

    // MARK: - Define
    enum Action {
        case delete(indexPath: IndexPath)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var favoriteVideoImageView: UIImageView!
    @IBOutlet private weak var titleFavoriteVideoLabel: UILabel!

    // MARK: - Properties
    var viewModel: FavoriteCellViewModel? {
        didSet {
            updateView()
        }
    }
    weak var delegate: FavoriteCellDelegate?
    var indexPathForCell: IndexPath?

    // MARK: - Private functions
    private func updateView() {
        viewModel?.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.favoriteVideoImageView.image = image
        })
        titleFavoriteVideoLabel.text = viewModel?.video.title
    }

    // MARK: - Private functions
    @IBAction private func deleteButtonTouchUpInside(_ sender: Any) {
        if let delegate = delegate, let indexPathForCell = indexPathForCell {
            delegate.cell(cell: self, needPerfom: .delete(indexPath: indexPathForCell))
        }
    }
}
