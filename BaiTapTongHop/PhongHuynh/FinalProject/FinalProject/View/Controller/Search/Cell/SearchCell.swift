//
//  SearchCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/23/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class SearchCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var searchImageView: UIImageView!
    @IBOutlet private weak var titleSearch: UILabel!

    // MARK: - Properties
    var viewModel: SearchCellViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private funcitons
    private func updateView() {
        viewModel?.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.searchImageView.image = image
        })
        titleSearch.text = viewModel?.video.title
    }
}
