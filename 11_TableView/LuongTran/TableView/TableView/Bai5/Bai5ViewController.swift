//
//  Bai5ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class Bai5ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    var viewModel: Bai5ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        viewModel.loadData()
        configTableView()
        configSearchBar()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Define.cellName)
        tableView.dataSource = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }

    private func search(keyword: String) {
        guard let viewModel = viewModel else { return }
        viewModel.contacts = getContacts(keyword: keyword)
        tableView.reloadData()
    }
    
    private func getContacts(keyword: String) -> [String] {
        guard let viewModel = viewModel else { return [""] }
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return viewModel.contactsData
        } else {
            var data: [String] = []
            for contact in viewModel.contactsData {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
    
}

extension Bai5ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Define.cellName, for: indexPath)
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

extension Bai5ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let keyword = ((searchBar.text ?? "") as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(keyword: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}

extension Bai5ViewController {
    private struct Define {
        static var cellName: String = "tableViewContact"
    }
}
