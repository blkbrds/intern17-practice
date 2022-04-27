import UIKit

struct Member {
    let name: String
    let avatar: UIImage
}

enum Status {
    case standard
    case small
    
    var itemSize: CGSize {
        switch self {
        case .standard: return CGSize(width: 150, height: 180)
        case .small: return CGSize(width: 80, height: 80)
        }
    }
    
    var sectionInset: UIEdgeInsets {
        switch self {
        case .standard: return UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        case .small: return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    var headerReferenceSize: CGSize {
        switch self {
        case .standard: return CGSize(width: 400, height: 80)
        case .small: return CGSize(width: 400, height: 40)
        }
    }
    
    var footerReferenceSize: CGSize {
        switch self {
        case .standard: return CGSize(width: 400, height: 40)
        case .small: return CGSize(width: 400, height: 30)
        }
    }
}

enum Team: Int {
    case avengers
    case guardians
    case xmen
    
    var teamName: String {
        switch self {
        case .avengers: return "Avengers"
        case .guardians: return "Guardians of the galaxy"
        case .xmen: return "X-men"
        }
    }
    
    var teamAvatar: UIImage {
        switch self {
        case .avengers: return #imageLiteral(resourceName: "husky")
        case .guardians: return #imageLiteral(resourceName: "a2")
        case .xmen: return #imageLiteral(resourceName: "a1")
        }
    }
    
    var members: [Member] {
        switch self {
        case .avengers: return [Member(name: "Thor", avatar: #imageLiteral(resourceName: "a6")), Member(name: "Captain America", avatar: #imageLiteral(resourceName: "a4")), Member(name: "Iron man", avatar: #imageLiteral(resourceName: "a3")),
                                Member(name: "Black widow", avatar: #imageLiteral(resourceName: "a2")), Member(name: "Haweye", avatar: #imageLiteral(resourceName: "husky")), Member(name: "Hulk", avatar: #imageLiteral(resourceName: "a6"))]
        case .guardians: return [Member(name: "Star lord", avatar: #imageLiteral(resourceName: "a6")), Member(name: "Rocket racoon", avatar: #imageLiteral(resourceName: "a4")), Member(name: "Gamora", avatar: #imageLiteral(resourceName: "a3")),
                                 Member(name: "Drax", avatar: #imageLiteral(resourceName: "a2")), Member(name: "Groot", avatar: #imageLiteral(resourceName: "husky"))]
        case .xmen: return [Member(name: "Storm", avatar: #imageLiteral(resourceName: "a6")), Member(name: "Beast", avatar: #imageLiteral(resourceName: "a4")), Member(name: "Wolverine", avatar: #imageLiteral(resourceName: "a3"))]
        }
    }
    static var count: Int { return Team.xmen.rawValue + 1}
}

class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var status = Status.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configCollectionView()
        
    }
    
    func configCollectionView() {
        let cellNib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "HomeCell")
        
        let headerNib = UINib(nibName: "TeamHeaderReusableView", bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TeamHeaderReusableView")
        
        let footerNib = UINib(nibName: "TeamHeaderReusableView", bundle: Bundle.main)
        collectionView.register(footerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TeamHeaderReusableView")
     //   collectionView.delegate = self
        collectionView.dataSource = self
    }
    
//    func configNavigationBar() {
//        title = ""
//        turn
//    }
//
//    @objc func turnOnStandarMode() {
//        changeFlo
//    }
    
//    func changeFlowLayout(status: Status) {
//        self.status = status
//        if let headerViews = self.collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader) as? [TeamHeaderReusableView] {
//            for headerView in headerViews {
//                headerView.updat
//            }
//        }
//    }

}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Team.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let team = Team(rawValue: section) else {
            fatalError("Team value is nil")
        }
        return team.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let team = Team(rawValue: indexPath.section) else {
            fatalError("Team value is nil")
        }
        guard indexPath.item < team.members.count else {
            fatalError("Member index is out of bounds")
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.updateCell(avatar: team.members[indexPath.item].avatar, name: team.members[indexPath.item].name, status: status)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = Team(rawValue: indexPath.section) else {
                fatalError("Team value is nil")
            }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TeamHeaderReusableView", for: indexPath) as! TeamHeaderReusableView
            header.updateHeaderView(avatar: team.teamAvatar, name: team.teamName, status: status)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TeamHeaderReusableView", for: indexPath) as! TeamHeaderReusableView
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 400, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 400, height: 40)
    }
    
}




