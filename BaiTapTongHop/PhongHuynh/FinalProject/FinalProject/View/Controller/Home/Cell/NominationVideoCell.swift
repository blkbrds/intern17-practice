//
//  NominationVideoCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/15/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

// MARK: - NominationVideoCellDelegate
protocol NominationVideoCellDelegate: class {

    func controller(controller: NominationVideoCell, needsPerfom actions: NominationVideoCell.Action)
}

final class NominationVideoCell: UITableViewCell {

    // MARK: - Define
    enum Action {
        case moveToDetail(indexPath: IndexPath, type: HomeViewModel.CellType)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var sectionLabel: UILabel!

    // MARK: - Properties
    var viewModel: NominationVideoCellViewModel? {
        didSet {
            collectionView.reloadData()
            sectionLabel.text = viewModel?.type.title
        }
    }
    weak var delegate: NominationVideoCellDelegate?

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    // MARK: - Private functions
    private func configCollectionView() {
        collectionView.register(NominationCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSourceUICollectionViewDataSource
extension NominationVideoCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(NominationCell.self, forIndexPath: indexPath)
        cell.viewModel = viewModel?.viewModelForItem(indexPath: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate, let type = viewModel?.type {
            delegate.controller(controller: self, needsPerfom: .moveToDetail(indexPath: indexPath, type: type))
        }
    }
}

// MARK: - UICollectionViewDelegate
extension NominationVideoCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - (1 * 4)) / 2.2, height: 250)
        }
}
