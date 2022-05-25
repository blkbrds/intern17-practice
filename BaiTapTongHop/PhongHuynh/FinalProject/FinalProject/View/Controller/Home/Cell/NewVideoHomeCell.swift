//
//  NewVideoHomeCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

// MARK: - NewVideoHomeCellDelegate
protocol NewVideoHomeCellDelegate: class {
    func controller(controller: NewVideoHomeCell, needsPerfom actions: NewVideoHomeCell.Action)
}

final class NewVideoHomeCell: UITableViewCell {

    // MARK: - Define
    enum Action {
        case moveToDetail(indexPath: IndexPath)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: NewVideoHomeCellViewModel? {
        didSet {
            collectionView.reloadData()
        }
    }
    weak var delegate: NewVideoHomeCellDelegate?

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Private functions
    private func configCollectionView() {
        collectionView.register(NominationCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSourceUICollectionViewDataSource
extension NewVideoHomeCell: UICollectionViewDataSource {

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
        if let delegate = delegate {
            delegate.controller(controller: self, needsPerfom: .moveToDetail(indexPath: indexPath))
        }
    }
}

// MARK: - UICollectionViewDelegate
extension NewVideoHomeCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - (10 * 3)) / 2, height: 200)
    }
}
