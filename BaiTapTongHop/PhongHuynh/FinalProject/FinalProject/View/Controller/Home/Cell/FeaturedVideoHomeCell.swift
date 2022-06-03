//
//  FeaturedVideoHomeCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

// MARK: - FeaturedVideoHomeCellDelegate
protocol FeaturedVideoHomeCellDelegate: class {

    func controller(controller: FeaturedVideoHomeCell, needsPerfom actions: FeaturedVideoHomeCell.Action)
}

final class FeaturedVideoHomeCell: UITableViewCell {

    // MARK: - Define
    enum Action {
        case moveToDetail(indexPath: IndexPath)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: FeaturedVideoHomeCellViewModel? {
        didSet {
            collectionView.reloadData()
        }
    }
    weak var delegate: FeaturedVideoHomeCellDelegate?

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
        collectionView.register(FeaturedCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSourceUICollectionViewDataSource
extension FeaturedVideoHomeCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(FeaturedCell.self, forIndexPath: indexPath)
        cell.viewModel = viewModel?.viewModelForItem(indexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension FeaturedVideoHomeCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.controller(controller: self, needsPerfom: .moveToDetail(indexPath: indexPath))
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 250)
    }
}
