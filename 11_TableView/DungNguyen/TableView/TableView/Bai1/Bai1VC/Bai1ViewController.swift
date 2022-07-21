//
//  Bai1ViewController.swift
//  TableView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/6/22.
//

import UIKit

final class Bai1ViewController: UIViewController {

    // MARK:  - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: Properties
    var names: [String] = []
    var filterNames: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        loadData()
        configTableView()
        configSearchBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.tableView.keyboardDismissMode = .onDrag
    }
    
    // MARK: - Private functions
    private func configUI() {
        title = "Home"
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Data", withExtension: "plist") else { return }
        guard let nameData = NSArray(contentsOf: path) as? [String] else { return }
        names = nameData
        filterNames = names
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func search(keyword: String) {
        filterNames = getListName(keyword: keyword)
        tableView.reloadData()
    }
    
    private func getListName(keyword: String) -> [String] {
        if keyword.isEmpty {
            return names
        } else {
            var data: [String] = []
            for list in names {
                if let _ = list.range(of: keyword) {
                    data.append(list)
                }
            }
            return data
        }
    }
}

// MARK: - Extensions
extension Bai1ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = filterNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.name = filterNames[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension Bai1ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(keyword: searchText)
    }
}
