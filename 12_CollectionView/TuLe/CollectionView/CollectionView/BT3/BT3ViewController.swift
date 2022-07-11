import UIKit

final class BT3ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var element: [String] = ["Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên" ,"Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên", "Nguyễn Nhật Quyên"]
    private let cell: String = "CollectionViewCell"
    private let header: String = "header"

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "BT3CollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: cell)
        let headerNib = UINib(nibName: "HeaderCollectionReusableView", bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension BT3ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        element.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as? BT3CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateCell(value: element[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
}

extension BT3ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header, for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        header.updateHeader(name: "Section \(indexPath.section)")
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 40) / 5
        return CGSize(width: width, height: width)
    }
}
