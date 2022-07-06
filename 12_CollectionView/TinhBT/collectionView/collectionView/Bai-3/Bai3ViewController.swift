//
//  Bai3ViewController.swift
//  collectionView
//
//  Created by Tinh Bui T. VN.Danang on 5/27/22.
//

import UIKit

struct Member {
    let name: String
    let avatar: UIImage
}

// MARK: - Define
enum Status {
    case standard
    case small
    
    var itemSize: CGSize {
        switch self {
        case .standard: return CGSize(width: 130, height: 150)
        case .small: return CGSize(width: 70, height: 70)
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
        case .avengers: return #imageLiteral(resourceName: "avg1")
        case .guardians: return #imageLiteral(resourceName: "guardians")
        case .xmen: return #imageLiteral(resourceName: "xmen")
        }
    }
    var members: [Member] {
        switch self {
        case .avengers: return [Member(name: "Thor", avatar: #imageLiteral(resourceName: "thor")),
                                Member(name: "Captain America", avatar: #imageLiteral(resourceName: "cap")),
                                Member(name: "Iron man", avatar: #imageLiteral(resourceName: "ironman")),
                                Member(name: "Black Widow", avatar: #imageLiteral(resourceName: "widow")),
                                Member(name: "Haweye", avatar: #imageLiteral(resourceName: "hawe")),
                                Member(name: "Hulk", avatar: #imageLiteral(resourceName: "hulk"))]
        case .guardians: return [Member(name: "Star lord", avatar: #imageLiteral(resourceName: "Starlord")),
                                 Member(name: "Rocket racoon", avatar: #imageLiteral(resourceName: "rocket")),
                                 Member(name: "Gamora", avatar: #imageLiteral(resourceName: "gamora")),
                                 Member(name: "Drax", avatar: #imageLiteral(resourceName: "draw")),
                                 Member(name: "Groot", avatar: #imageLiteral(resourceName: "grooo"))]
        case .xmen: return [Member(name: "Storm", avatar: #imageLiteral(resourceName: "Storm")),
                            Member(name: "Beast", avatar: #imageLiteral(resourceName: "Beast")),
                            Member(name: "Wolverine", avatar: #imageLiteral(resourceName: "Wolverine"))]
        }
    }
    static var count: Int { return Team.xmen.rawValue + 1}
}

final class Bai3ViewController: UIViewController {
    
    // MARK: - Properties
    var status = Status.standard
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mavel"
        configCollectionView()
        configNavigationBar()
    }
    
    // MARK: - Private functions
    private func configCollectionView() {
        let cellNib = UINib(nibName: "Bai3CollectionViewCell", bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "Bai3CollectionViewCell")
        
        let headerNib = UINib(nibName: "TeamHeaderReusableView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TeamHeaderReusableView")
        
        let footerNib = UINib(nibName: "TeamFooterReusableView", bundle: .main)
        collectionView.register(footerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TeamFooterReusableView")
        
        collectionView.dataSource = self
    }
    
    private func configNavigationBar() {
        title = "MArVEL"
        turnOnStandardMode()
    }
    
    private func changeFlowLayou(status: Status) {
        self.status = status
        if let headerView = self.collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader) as? [TeamHeaderReusableView] {
            for headerVie in headerView {
                headerVie.updateHeaderView(status: status)
            }
        }
        if let cells = self.collectionView.visibleCells as? [Bai3CollectionViewCell] {
            for cell in cells {
                cell.updateCell(status: status)
                cell.setNeedsLayout()
            }
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize  = status.itemSize
        flowLayout.sectionInset = status.sectionInset
        flowLayout.headerReferenceSize = status.headerReferenceSize
        flowLayout.footerReferenceSize = status.footerReferenceSize
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
    // MARK: - Objc functions
    @objc private func turnOnStandardMode() {
        changeFlowLayou(status: .standard)
        let smallButton = UIBarButtonItem(title: "small", style: .plain, target: self, action: #selector(turnOnSmallModel))
        navigationItem.rightBarButtonItem = smallButton
    }
    
    @objc private func turnOnSmallModel() {
        changeFlowLayou(status: .small)
        let standardButton = UIBarButtonItem(title: "Standard", style: .plain, target: self, action: #selector(turnOnStandardMode))
        navigationItem.rightBarButtonItem = standardButton
    }
    
}

//MARK: - UICollectionViewDataSource
extension Bai3ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Team.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let team = Team(rawValue: section)
        else { fatalError("team value is nib") }
        return team.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let team = Team(rawValue: indexPath.section)
        else { fatalError("team value is nib") }
        guard indexPath.item < team.members.count
        else {fatalError("Member index is out of bounds")}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Bai3CollectionViewCell", for: indexPath) as! Bai3CollectionViewCell
        cell.updateCell(avatar: team.members[indexPath.item].avatar, name: team.members[indexPath.item].name, status: status)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = Team(rawValue: indexPath.section)
            else { fatalError("team value is nib") }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TeamHeaderReusableView", for: indexPath) as! TeamHeaderReusableView
            header.updateHeaderView(avatar: team.teamAvatar, name: team.teamName, status: status)
            return header
        case UICollectionView.elementKindSectionFooter:
            let fooder = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TeamFooterReusableView", for: indexPath) as! TeamFooterReusableView
            return fooder
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension Bai3ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 150)
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
