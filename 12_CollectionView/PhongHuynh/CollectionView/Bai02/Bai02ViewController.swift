import UIKit

final class Label {
    
    // MARK: - Properties
    var label: String
    
    // MARK: - Init
    init(label: String) {
        self.label = label
    }
}

// MARK: Extension
extension Label {
    
    static func getDummyDatas() -> [Label] {
        var labels: [Label] = []
        for _ in 0...19 {
            let label = Label(label: "")
            labels.append(label)
        }
        return labels
    }
}

final class Bai02ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var label: [Label] = Label.getDummyDatas()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }

    // MARK: - Private functions
    private func configCollectionView() {
        let nib = UINib(nibName: "Bai02CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension Bai02ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        label.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Bai02CollectionViewCell else { return UICollectionViewCell() }
        let item = label[indexPath.row]
        cell.name = item.label
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension Bai02ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width - (20 * 4)) / 3, height: CGFloat(Int.random(in: 50..<200)))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
