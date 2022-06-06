//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: ProfileViewModel = ProfileViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    // MARK: - Private functions
    private func configTableView() {
        tableView.register(ProfileCell.self)
        tableView.register(LogOutCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
@available(iOS 13.0, *)
extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = ProfileViewModel.CellType(rawValue: indexPath.row) else { return UITableViewCell() }
        switch cellType {
        case .profile:
            let cell = tableView.dequeue(ProfileCell.self)
            cell.delegate = self
            return cell
        case .logout:
            let cell = tableView.dequeue(LogOutCell.self)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = ProfileViewModel.CellType(rawValue: indexPath.row) else { return 0 }
        switch cellType {
        case .profile:
            return 150
        case .logout:
            return 350
        }
    }
}

// MARK: - UITableViewDelegate
@available(iOS 13.0, *)
extension ProfileViewController: UITableViewDelegate {
}

// MARK: - ProfileCellDelegate
@available(iOS 13.0, *)
extension ProfileViewController: ProfileCellDelegate {

    func cell(cell: ProfileCell, needsPerfom actions: ProfileCell.Action) {
        switch actions {
        case .cancel:
            dismiss(animated: true, completion: nil)
        }
    }
}
