//
//  BT4TableViewCell.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/8/22.
//

import UIKit

final class BT4TableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let distance = Distance()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configUICollectionView()
    }

    // MARK: - Private method
    private func configUICollectionView() {
        let nib = UINib(nibName: "BT4CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }

    // MARK: - IBActions
    @IBAction private func previousButtonTouchUpInside(_ sender: Any) {
        let contenOffsetX = collectionView.contentOffset.x
        guard (contenOffsetX - (UIScreen.main.bounds.width - (distance.leftDistance + distance.rightDistance))) >= 0 else { return }
        collectionView.setContentOffset(CGPoint(x: contenOffsetX - (UIScreen.main.bounds.width - (distance.leftDistance + distance.rightDistance)), y: 0), animated: true)
    }

    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let widthCollectionView = collectionView.contentSize.width
        let contenOffsetX = collectionView.contentOffset.x
        guard (contenOffsetX + UIScreen.main.bounds.width - (distance.leftDistance + distance.rightDistance)) < widthCollectionView else { return }
        collectionView.setContentOffset(CGPoint(x: contenOffsetX + UIScreen.main.bounds.width - (distance.leftDistance + distance.rightDistance), y: 0), animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension BT4TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BT4CollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BT4TableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - (distance.leftDistance + distance.rightDistance)
        return CGSize(width: screenWidth, height: UIScreen.main.bounds.height / 4)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - Config
extension BT4TableViewCell {
    struct Distance {
        var leftDistance: CGFloat = 20
        var rightDistance: CGFloat = 20
    }
}
