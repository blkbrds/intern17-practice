//
//  HomeViewController.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 07/05/2022.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Enum
    enum Identifier: String {
        case cell = "HomeCell"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var users: [User] = User.getDummyData()
    private var index: Int = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI
    override func setupUI() {
        title = "Home Girl"
        
        // Navigation Bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .orange
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            navigationController!.navigationBar.compactScrollEdgeAppearance = appearance
        }
        
        // Register
        let nib = UINib(nibName: Identifier.cell.rawValue, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: Identifier.cell.rawValue)
        
        // Delegate && Datasource
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Data
    override func setupData() {}
    
    // MARK: - Private Function
    private func updateUser(user: User) {
        users[index] = user
    }
}

// MARK: - Extention UITableViewDataSource && UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cell.rawValue, for: indexPath) as! HomeCell
        let users = users[indexPath.row]
        cell.updateProfile(name: users.name, date: users.date)
        cell.delegate = self
        return cell
    }
}

// MARK: - Implement Protocol DetailViewControllerViewDelegate
extension HomeViewController: DetailViewControllerViewDelegate {
    func controller(view: DetailViewController, needsPerform action: DetailViewController.Action) {
        switch action {
        case .update(let user):
            self.updateUser(user: user)
            tableView.reloadData()
        }
    }
}

// MARK: - Implement Protocol HomeCellDelegate
extension HomeViewController: HomeCellDelegate {
    func cell(_ cell: HomeCell, needsPerform action: HomeCell.Action) {
        switch action {
        case .screenToDetail:
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            index = indexPath.row
            let vc = DetailViewController()
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
