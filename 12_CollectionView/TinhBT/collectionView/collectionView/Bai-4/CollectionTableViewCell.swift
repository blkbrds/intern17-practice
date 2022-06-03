//
//  CollectionTableViewCell.swift
//  collectionView
//
//  Created by Tinh Bui T. VN.Danang on 5/30/22.
//

import UIKit

final class CollectionTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
        collectionView.isScrollEnabled = false
    }
    
    // MARK: - Private functions
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func moveCollectionToFrame(contentOffset : CGFloat) {
        let frame: CGRect = CGRect(x : contentOffset, y : self.collectionView.contentOffset.y ,width : self.collectionView.frame.width,height : self.collectionView.frame.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func buttonLeftTouchUpInside(_ sender: UIButton) {
        let collectionBounds = self.collectionView.bounds
        let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x - collectionBounds.size.width - 10))
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
    
    @IBAction private func buttonRighttouchUpInside(_ sender: UIButton) {
        let collectionBounds = self.collectionView.bounds
        let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x + collectionBounds.size.width + 10))
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        
        return cell
    }
}
