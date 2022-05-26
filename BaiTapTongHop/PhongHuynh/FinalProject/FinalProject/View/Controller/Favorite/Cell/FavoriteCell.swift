//
//  FavoriteCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

protocol FavoriteCellDelegate: class {
    func cell(cell: FavoriteCell, needsPerfom actions: FavoriteCell.Action)
}

final class FavoriteCell: UITableViewCell {
    
    enum Action {
        case delete(results: [RealmVideo])
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var favoriteVideoImageView: UIImageView!
    @IBOutlet private weak var titleFavoriteVideoLabel: UILabel!

    // MARK: - Properties
    var viewModel: FavoriteCellViewModel? {
        didSet {
            updateView()
        }
    }
    weak var delegate: FavoriteCellDelegate?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Private functions
    private func updateView() {
        viewModel?.updateImageView(completion: { [weak self] (image) in
            guard let this = self else { return }
            this.favoriteVideoImageView.image = image
        })
        titleFavoriteVideoLabel.text = viewModel?.video.title
    }

    // MARK: - IBActions
    @IBAction private func deleteData(_ sender: Any) {
        do {
            let realm = try Realm()
            let results = realm.objects(RealmVideo.self).filter("title = \(viewModel?.video.title) AND image = \(viewModel?.video.image)").toArray(ofType: RealmVideo.self)
            if let delegate = delegate {
                delegate.cell(cell: self, needsPerfom: .delete(results: results))
            }
        } catch {
        }
    }
}
