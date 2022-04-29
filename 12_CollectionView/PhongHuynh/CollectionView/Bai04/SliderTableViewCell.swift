import UIKit

final class SliderTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    
    // MARK: - Properties
    private var currentIndex: IndexPath = IndexPath(item: 0, section: 0) {
        didSet {
            currentIndex.item = currentIndex.item < 0 ? 0 : currentIndex.item
            currentIndex.item = currentIndex.item > 19 ? 19 : currentIndex.item
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private funtions
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction private func leftButton(_ sender: Any) {
        currentIndex.item -= 1
        collectionView.scrollToItem(at: currentIndex, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction private func rightButton(_ sender: Any) {
        currentIndex.item += 1
        collectionView.scrollToItem(at: currentIndex, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension SliderTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
