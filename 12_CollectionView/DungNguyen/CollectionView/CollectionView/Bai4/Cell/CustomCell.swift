//
//  CustomeCell.swift
//  CollectionView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/7/22.
//

import UIKit

final class CustomCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private function
    private func configCell() {
        let cellNib = UINib(nibName: "CollectionCell", bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        }
}

// MARK: - Extensions
extension CustomCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension CustomCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 50
        return CGSize(width: screenWidth / 4, height: (screenWidth / 4) * 6 / 5)
    }
}

