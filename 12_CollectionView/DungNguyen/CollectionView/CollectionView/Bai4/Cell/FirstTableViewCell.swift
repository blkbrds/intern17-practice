//
//  FirstTableViewCell.swift
//  CollectionView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/8/22.
//

import UIKit

final class FirstTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var firstCollectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private finction
    private func configCell() {
        let cellNib = UINib(nibName: "FirstCell", bundle: .main)
        firstCollectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        firstCollectionView.collectionViewLayout = layout
        firstCollectionView.showsHorizontalScrollIndicator = false
        firstCollectionView.dataSource = self
        firstCollectionView.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction private func backButtonTouchUpInside(_ sender: Any) {
        let contentOffsetX = firstCollectionView.contentOffset.x
        let screenWitdh = UIScreen.main.bounds.width - 40
        guard contentOffsetX - screenWitdh >= 0 else {
            return
        }
        firstCollectionView.setContentOffset(CGPoint(x: contentOffsetX - screenWitdh, y: 0), animated: true)
    }
    
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let witdhCollection = firstCollectionView.contentSize.width
        let contentOffsetX = firstCollectionView.contentOffset.x
        let screenWitdh = UIScreen.main.bounds.width - 40
        guard contentOffsetX + screenWitdh < witdhCollection else {
            return
        }
        firstCollectionView.setContentOffset(CGPoint(x: contentOffsetX + screenWitdh, y: 0), animated: true)
    }
    
}

// MARK: - Extensions
extension FirstTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension FirstTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWitdh = UIScreen.main.bounds.width - 40
        let screenHeight = UIScreen.main.bounds.height / 4
        return CGSize(width: screenWitdh, height: screenHeight )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

