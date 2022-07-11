import UIKit

final class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let headerCell: String = "HeaderCollectionViewCell"
    
    func updateCell() {
        let nib = UINib(nibName: "HeaderCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: headerCell)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func moveCollectionToFrame(contentOffset : CGFloat) {
        let frame: CGRect = CGRect(x : contentOffset, y : self.collectionView.contentOffset.y ,width : self.collectionView.frame.width,height : self.collectionView.frame.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
    
    @IBAction private func preButto(_ sender: UIButton) {
        let collectionBounds = self.collectionView.bounds
        let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x - collectionBounds.size.width - 10))
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
    
    @IBAction private func nextButton(_ sender: UIButton) {
        let collectionBounds = self.collectionView.bounds
        let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x + collectionBounds.size.width + 10))
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
}

extension HeaderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCell, for: indexPath) as! HeaderCollectionViewCell
        return cell
    }
}

extension HeaderTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 30
        return CGSize(width: width, height: width / 2)
    }
}
