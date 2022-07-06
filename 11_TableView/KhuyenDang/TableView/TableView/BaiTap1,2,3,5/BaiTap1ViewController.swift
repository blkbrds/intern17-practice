//
//  BaiTap1ViewController.swift
//  TableView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/5/22.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    var persons: [String] = []
    var currentPersons: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        getDataFromPlist()
        configUITableView()
        configSearchBar()
    }
    
    // MARK: - Private methods
    private func configUITableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        currentPersons = persons
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func getDataFromPlist() {
        guard let path = Bundle.main.url(forResource: "Data", withExtension: "plist") else { return}
        guard let personsData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        persons = personsData
    }
    
    private func getPersons(keyWord: String) -> [String]{
        if keyWord.isEmpty {
            return persons
        } else {
            var data: [String] = []
            for person in persons {
                if let _ = person.range(of: keyWord) {
                    data.append(person)
                }
            }
            return data
        }
    }
    
    private func search(keyWord: String) {
        currentPersons = getPersons(keyWord: keyWord)
        tableView.reloadData()
    }
}

// MARK: - Extension
extension BaiTap1ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(currentPersons[indexPath.row])"
        return cell
    }
}

extension BaiTap1ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personDetailViewController = PersonDetailViewController()
        personDetailViewController.name = currentPersons[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(personDetailViewController, animated: true)
    }
}

extension BaiTap1ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(keyWord: searchText)
    }
}

