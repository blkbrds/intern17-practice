//
//  Exercise02ViewController.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class Exercise02ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var names: [[String]] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    // MARK: - Private Fucntions
    private func setupUI() {
        // title
        title = "Ex234"
        view.backgroundColor = .lightGray
        
        // Register
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Delegate && Datasource
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupData() {
        loadDataPlist()
    }
    
    // MARK: - Public Function
    func loadDataPlist() {
        guard let path = Bundle.main.url(forResource: "Names", withExtension: "plist") else { return }
        guard let namesData = NSArray(contentsOf: path) as? [[String]] else { return }
        names = namesData
    }
}

// MARK: - Extention UITableView Datasource && Delegate
extension Exercise02ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Section 1"
        case 1: return "Section 2"
        default: return "Section 3"
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.section][indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.name = names[indexPath.section][indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
