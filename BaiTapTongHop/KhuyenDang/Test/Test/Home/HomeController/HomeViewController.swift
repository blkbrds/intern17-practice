//
//  HomeViewController.swift
//  Test
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/20/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: HomeViewModel?
    var homeCell: HomeCell?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        configUI()
        configUITableView()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Home"
        tableView.separatorStyle = .none
    }
    
    private func configUITableView() {
        let nib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setUpData() {
        guard let viewModel = viewModel else {
            return
        }
        viewModel.getDataFromPlist()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        cell.delegate = self
        let cellViewModel = viewModel.viewModelForItem(at: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - HomeCellDelegate
extension HomeViewController: HomeCellDelegate {
    func cell(_ cell: HomeCell, needPerformAction action: HomeCell.Action) {
        switch action {
        case .updatedUser:
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            guard let viewModel = viewModel else { return }
            let detailVC = DetailViewController()
            let detailViewModel = viewModel.viewModelForDetail(at: indexPath)
            detailVC.viewModel = detailViewModel
            viewModel.indexPathSelected = indexPath
            detailVC.delegate = self
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

// MARK: - DetailViewControllerDelegate
extension HomeViewController: DetailViewControllerDelegate {
    func controller(_ controller: DetailViewController, neesPerformAction action: DetailViewController.Action) {
        switch action {
        case .updatedUser(let user):
            guard let viewModel =  viewModel else {
                return
            }
            viewModel.updateUser(user: user)
            tableView.reloadRows(at: [viewModel.indexPathSelected], with: .none)
        }
    }
}
