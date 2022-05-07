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
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI
    override func setupUI() {
        title = "Home"
        // Register
        let nib = UINib(nibName: Identifier.cell.rawValue, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: Identifier.cell.rawValue)
        
        // Delegate && Datasource
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Data
    override func setupData() {}
}

// MARK: - Extention UITableViewDataSource && UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cell.rawValue, for: indexPath) as! HomeCell
        let user = users[indexPath.row]
        cell.updateProfile(name: user.name, date: user.date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
