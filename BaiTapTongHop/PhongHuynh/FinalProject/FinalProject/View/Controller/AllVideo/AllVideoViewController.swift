//
//  AllVideoViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 6/9/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class AllVideoViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: AllVideoViewModel? {
        didSet {
            switch viewModel?.type {
            case .nomination:
                loadNominationVideoData()
            case .new:
                loadNewVideoData()
            case .featured:
                print("aa")
            case .none:
                print("")
            }
        }
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configNavigation()
        loadNominationVideoData()
    }

    // MARK: - Private functions
    private func configCollectionView() {
        collectionView.register(NominationCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func configNavigation() {
        title = "All video"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
    }

    private func loadNominationVideoData() {
        viewModel?.loadNominationVideoAPI { [weak self] (result) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    this.collectionView.reloadData()
                case .failure(let error):
                    this.alert(title: "Error", msg: error.localizedDescription, handler: nil)
                }
            }
        }
    }

    private func loadNewVideoData() {
        viewModel?.loadNewVideoAPI { [weak self] (result) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    this.collectionView.reloadData()
                case .failure(let error):
                    this.alert(title: "Error", msg: error.localizedDescription, handler: nil)
                }
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension AllVideoViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        let cell = collectionView.dequeue(NominationCell.self, forIndexPath: indexPath)
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AllVideoViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - (5 * 3)) / 2, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = viewModel?.viewModelForDetail(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}
