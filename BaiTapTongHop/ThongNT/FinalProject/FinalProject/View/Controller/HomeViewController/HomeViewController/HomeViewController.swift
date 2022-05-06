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

    var viewModel = HomViewModel()
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configTableView()
        configRefreshControl()
    }

    // MARK: - Private functions
    private func setupUI() {
        title = "Videos"
        loadAPI()
        navigationController?.navigationBar.barTintColor = .systemRed
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = true
    }

    private func configTableView() {
        tableView.register(ThumbnailTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.addSubview(refreshControl)
    }

    private func configRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
    }

    @objc private func refreshTableView() {
        loadAPI()
    }

    private func loadAPI() {
        viewModel.api { [weak self] error in
            if let error = error?.localizedDescription {
                self?.showAlert(title: "Load Videos Warning", message: error)
            } else {
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }

    private func loadMore() {
        viewModel.loadMore { error in
            if let error = error?.localizedDescription {
                self.showAlert(title: "Load More Warning", message: error)
            } else {
                self.tableView.reloadData()
            }
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Extension delegate of UITableView
extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let snippet = viewModel.getSnippet(with: indexPath.row)
        detailVC.viewModel = DetailViewControllerModel(snippet: snippet)
        detailVC.modalPresentationStyle = .fullScreen
        navigationController?.present(detailVC, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.getVideosCount() - 1) {
//            loadMore()
        }
    }
}

// MARK: - Extension datasource of UITableView
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
