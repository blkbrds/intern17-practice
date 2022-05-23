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
        case moveToDetail(indexPath: IndexPath)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: NominationVideoCellViewModel? {
        didSet {
            collectionView.reloadData()
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
        let nib = UINib(nibName: "NominationCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "NominationCell")
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NominationCell", for: indexPath) as? NominationCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel?.viewModelForItem(indexPath: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.controller(controller: self, needsPerfom: .moveToDetail(indexPath: indexPath))
        }
    }
}

// MARK: - UICollectionViewDelegate
extension NominationVideoCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - (10 * 3)) / 2, height: 200)
        }
}
