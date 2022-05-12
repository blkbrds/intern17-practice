//
//  FavoriteViewController.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/5/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class FavoriteViewController: UIViewController {

    // MARK: Properties
    @IBOutlet private weak var tableView: UITableView!

    var viewModel: FavoriteViewControllerModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        fetchData()
        setupUI()
        updateData()
    }

    private func fetchData() {
        guard let viewModel = viewModel else { return }
        viewModel.fetchData { [weak self] done in
            if done {
                self?.tableView.reloadData()
            } else {
//                fatalError()
            }
        }
    }

    private func updateData() {
        guard let viewModel = viewModel else { return }
        viewModel.setupObserve { [weak self] _ in
            self?.fetchData()
        }
    }

    private func setupUI() {
        title = "Favorite"
        navigationController?.navigationBar.barTintColor = .systemRed
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white

        // add remove button on left bar item
        let removeButton = UIBarButtonItem(image: UIImage(systemName: "trash"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(deleteVideo))
        navigationItem.leftBarButtonItem = removeButton
    }

    // MARK: Config
    private func configTable() {
        tableView.register(ThumbnailTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: Objc functions
    @objc private func deleteVideo() {

    }
}

// MARK: Extension Delegate of tableView
extension FavoriteViewController: UITableViewDelegate { }

// MARK: Extension Datasource of tableView
extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.getVideosCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailTableViewCell",
                                                       for: indexPath) as? ThumbnailTableViewCell else { return UITableViewCell() }
        guard let favo = viewModel?.getFavoriteVideoInfo(with: indexPath.row) else { return UITableViewCell() }
//        cell.viewModel = ThumbnailTableViewCellModel(snippet: snippet)
        return cell
    }
}
