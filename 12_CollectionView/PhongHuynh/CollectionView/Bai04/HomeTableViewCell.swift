import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView2: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // MARK: - Private functions
    private func configCollectionView() {
        collectionView2.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionView2.dataSource = self
        collectionView2.delegate = self
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}
