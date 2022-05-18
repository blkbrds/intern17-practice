//
//  NewVideoHomeCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/17/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

protocol NewVideoHomeCellDelegate: class {
    func controller(controller: NewVideoHomeCell, needsPerfom actions: NewVideoHomeCell.Action)
}

final class NewVideoHomeCell: UITableViewCell {
    
    enum Action {
        case moveToHome(indexPath: IndexPath)
    }

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!

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
        let nib = UINib(nibName: "NominationCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "NewVideoCell")
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewVideoCell", for: indexPath) as? NominationCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel?.viewModelForItem(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.controller(controller: self, needsPerfom: .moveToHome(indexPath: indexPath))
        }
    }
}

// MARK: - UICollectionViewDelegate
extension NewVideoHomeCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - (10 * 3)) / 2, height: 200)
    }
}