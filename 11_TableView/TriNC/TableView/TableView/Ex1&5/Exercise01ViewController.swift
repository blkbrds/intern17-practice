//
//  Exercise01ViewController.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit


final class Exercise01ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    private var names: [String] = ["Nguyen Van A", "Tran Van B", "Le Van C", "Du Van D", "Hoang Van E", "Huynh Van F", "Long Van G", "Ho Van DDE", "Kong Van AFA", "Jan Van CAA"]
   private var fillteredNames: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        title = "Ex1&&5"
        // delegate && datasource
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        // register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupData() {
        fillteredNames = names
    }
}

// MARK: - Extention TabbleView Delgate && DataSource && SearchBarDelegate
extension Exercise01ViewController: UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fillteredNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fillteredNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SearchTailViewController()
        vc.name = fillteredNames[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fillteredNames = searchText.isEmpty ? names : names.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableView.reloadData()
    }
}
