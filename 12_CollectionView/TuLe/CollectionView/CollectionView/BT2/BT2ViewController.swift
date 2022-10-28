import UIKit

final class BT2ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let cell = "CollectionViewCell"
    
    let arr: [CGFloat] = [100, 20, 200]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "BT2CollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: cell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension BT2ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath)
        return cell
    }
}

extension BT2ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 30) / 4
        let height = arr[indexPath.row % 3]
        return CGSize(width: width, height: height)
    }
}
