//
//  FavoriteViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

final class FavoriteViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: FavoriteViewModel = FavoriteViewModel()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configNavigation()
        configData()
    }

    // MARK: - Private functions
    private func configTableView() {
        tableView.register(FavoriteCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func configNavigation() {
        title = "Favorite"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    private func configData() {
        viewModel.addObserve()
        viewModel.completion = { () in
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension FavoriteViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(FavoriteCell.self)
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FavoriteViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = viewModel.viewModelForDetail(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - FavoriteCellDelegate
extension FavoriteViewController: FavoriteCellDelegate {

    func cell(cell: FavoriteCell, needPerfom actions: FavoriteCell.Action) {
        switch actions {
        case .delete:
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            viewModel.removeVideo(indexPath: indexPath)
        }
    }
}
