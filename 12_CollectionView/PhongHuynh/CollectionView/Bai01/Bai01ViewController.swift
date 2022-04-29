import UIKit

final class User {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension User {
    
    static func getDummyDatas() -> [User] {
        var users: [User] = []
        for i in 0...49 {
            let user = User(name: "User \(i)")
            users.append(user)
        }
        return users
    }
}

final class Bai01ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var users: [User] = User.getDummyDatas()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()
    }
    
    // MARK: - Private functions
    private func configCollectionView() {
        let nib = UINib(nibName: "Bai01CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension Bai01ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Bai01CollectionViewCell
        
        let item = users[indexPath.row]
        cell.numberLabel.text = item.name
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension Bai01ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width - (10 * 6)) / 5, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
