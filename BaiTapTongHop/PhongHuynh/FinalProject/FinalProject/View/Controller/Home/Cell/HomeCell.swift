//
//  HomeCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/12/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class HomeCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var nameYoutubeLabel: UILabel!
    @IBOutlet private weak var youtubeImage: UIImageView!

    // MARK: - Properties
    var viewModel: HomeCellViewModel? {
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
        nameYoutubeLabel.text = viewModel?.video.title
        Networking.shared().downloadImage(url: viewModel?.video.imageURL ?? "") { (image) in
            self.youtubeImage.image = image
        }
    }
}
