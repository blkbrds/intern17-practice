//
//  HomeViewController.swift
//  Test
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/20/22.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propertie
    var viewModel: HomeViewModel?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        title = "Home"
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    override func setupData() {
        loadCell()
    }
    
    // MARK: - Private function
    private func loadCell(){
        guard let viewModel = viewModel else { return }
        viewModel.loadCell()
    }
}

// MARK: - Extensions
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberRowOfSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel.cellViewModelForRow(at: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension HomeViewController: HomeCellDelegate {
    func cell(_ cell: HomeCell, needPerformAction action: HomeCell.Action) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        switch action {
        case .updateUser:
            guard let viewModel = viewModel else { return }
            let detailVC = DetailViewController()
            viewModel.indexPathSelected = indexPath
            detailVC.delegate = self
            detailVC.viewModel = viewModel.viewModelForDetail(at: indexPath)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension HomeViewController: DetailViewControllerDelegate {
    func controller(_ controller: DetailViewController, needPerformAction action: DetailViewController.Action) {
        switch action {
        case .updateUser(let user):
            guard let viewModel = viewModel else { return }
            viewModel.updateUser(user: user)
            tableView.reloadRows(at: [viewModel.indexPathSelected], with: .none)
        }
    }
}
