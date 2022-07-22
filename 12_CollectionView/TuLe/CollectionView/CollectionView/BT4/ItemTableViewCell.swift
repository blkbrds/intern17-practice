import UIKit

final class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private let itemCell: String = "ItemCollectionViewCell"
    
    func updateCell(name: String) {
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: itemCell)
        titleLabel.text = name
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension ItemTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemCell, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

