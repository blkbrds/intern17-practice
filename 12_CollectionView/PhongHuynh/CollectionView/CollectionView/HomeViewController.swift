import UIKit

class User {
    var name: String
    var avatar: String
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}
extension User {
    static func getDummyDatas() -> [User] {
        var users: [User] = []
        
        for i in 1...30 {
            let user = User(name: "User \(i)", avatar: "husky")
            users.append(user)
        }
        return users
    }
}

class HomeViewController: UIViewController, UICollectionViewFlowLayout {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var users: [User] = User.getDummyDatas()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        updateCollectionView()
        
    }
    
    func updateCollectionView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    func configCollectionView() {
        let cellNib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "HomeCell")
        
        let headerNib = UINib(nibName: "TeamHeaderReusableView", bundle: Bundle.main)
        
        
        let footerNib = UINib(nibName: "TeamHeaderReusableView", bundle: Bundle.main)
        collectionView.register(footerNib, forCellWithReuseIdentifier: "TeamHeaderReusableView")
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        let item = users[indexPath.row]
        cell.nameLabel.text = item.name
        cell.avatarImageView.image = UIImage(named: item.avatar)
        return cell
    }
}
