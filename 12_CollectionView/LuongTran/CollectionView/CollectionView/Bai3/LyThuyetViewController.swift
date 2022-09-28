//
//  LyThuyetViewController.swift
//  CollectionView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

final class LyThuyetViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: LyThuyetViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MARVEL"
        configCollectionView()
        turnOnStandardMode()
    }

    private func configCollectionView() {
        let cellNib = UINib(nibName: Define.cellHero, bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: Define.cellHero)
        
        let headerNib = UINib(nibName: Define.cellHeader, bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Define.cellHeader)
        
        let cellFooter = UINib(nibName: Define.cellFooter, bundle: Bundle.main)
        collectionView.register(cellFooter, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Define.cellFooter)
        
        collectionView.dataSource = self
//        collectionView.delegate = self
    }
    
    @objc private func turnOnStandardMode() {
        changeFlowLayout(status: .standard)
        let smallButton = UIBarButtonItem(title: "Small", style: .plain, target: self, action: #selector(turnOnSmallMode))
        navigationItem.rightBarButtonItem = smallButton
    }
    
    @objc private func turnOnSmallMode() {
        changeFlowLayout(status: .small)
        let standardButton = UIBarButtonItem(title: "Standard", style: .plain, target: self, action: #selector(turnOnStandardMode))
        navigationItem.rightBarButtonItem = standardButton
    }
    
    private func changeFlowLayout(status: Status) {
        guard let viewModel = viewModel else { return }
        viewModel.status = status
        if let headerViews = self.collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader) as? [TeamHeaderCollectionReusableView] {
            for headerView in headerViews {
                headerView.updateHeaderView(status: status)
            }
        }
        if let cells = self.collectionView.visibleCells as? [HeroCollectionViewCell] {
            for cell in cells {
                cell.updateCell(status: status)
            }
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = status.itemSize
        flowLayout.sectionInset = status.sectionInset
        flowLayout.headerReferenceSize = status.headerReferenceSize
        flowLayout.footerReferenceSize = status.footerReferenceSize
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
}

extension LyThuyetViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItemsInSection(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Define.cellHero, for: indexPath) as? HeroCollectionViewCell,
              let viewModel = viewModel else { return UICollectionViewCell() }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let viewModel = viewModel,
                  let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Define.cellHeader, for: indexPath) as? TeamHeaderCollectionReusableView
            else { return UICollectionReusableView() }
            header.viewModel = viewModel.viewModelHeader(at: indexPath)
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Define.cellFooter, for: indexPath) as? TeamFooterCollectionReusableView
            else { return UICollectionReusableView() }
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension LyThuyetViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Define.sizeItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Define.insetForItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return Define.sizeHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return Define.sizeFooter
    }
}

extension LyThuyetViewController {
    private struct Define {
        static var cellHero: String = String(describing: HeroCollectionViewCell.self)
        static var cellHeader: String = String(describing: TeamHeaderCollectionReusableView.self)
        static var cellFooter: String = String(describing: TeamFooterCollectionReusableView.self)
        static var sizeItem: CGSize = CGSize(width: 150, height: 180)
        static var insetForItem: UIEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        static var sizeHeader: CGSize = CGSize(width: 400, height: 80)
        static var sizeFooter: CGSize = CGSize(width: 400, height: 40)
    }
}
