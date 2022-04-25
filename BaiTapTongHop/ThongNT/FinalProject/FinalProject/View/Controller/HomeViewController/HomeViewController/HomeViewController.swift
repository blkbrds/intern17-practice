//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/20/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

enum TableViewCell: String {
    case defaultCell = "UITableViewCell"
    case customCell = "ThumbnailTableViewCell"
}

final class HomeViewController: ViewController {

    // MARK: - IBOutlet private variables
    @IBOutlet private weak var tableView: UITableView!

    let viewModel = HomViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configTableView()
    }

    // MARK: - Private functions
    private func setupUI() {
        title = "Videos"
        loadAPI()
    }

    func loadAPI() {
        viewModel.api { [weak self] error in
            if let _ = error {
                // TODO: - Show alert
            } else {
                self?.tableView.reloadData()
            }
        }
    }

    private func configTableView() {
        tableView.register(ThumbnailTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

// MARK: - Extension datasource and delegate of UITableView
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let snippet = viewModel.getSnippet(with: indexPath.row)
        detailVC.viewModel = DetailViewControllerModel(snippet: snippet)
        navigationController?.present(detailVC, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.video?.items.count else { return 0 }
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailTableViewCell",
                                                       for: indexPath) as? ThumbnailTableViewCell else { return UITableViewCell() }
        let snippet = viewModel.getSnippet(with: indexPath.row)
        cell.viewModel = ThumbnailTableViewCellModel(snippet: snippet)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
