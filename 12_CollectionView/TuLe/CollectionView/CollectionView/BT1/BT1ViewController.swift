import UIKit

final class BT1ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "BT1CollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        let width = (self.view.frame.width - 40) / 5
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
}

extension BT1ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! BT1CollectionViewCell
        cell.updateCell(value: "\(indexPath.row)")
        return cell
    }
}
