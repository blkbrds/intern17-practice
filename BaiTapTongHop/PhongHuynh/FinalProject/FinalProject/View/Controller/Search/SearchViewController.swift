//
//  SearchViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/23/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    var contacts: [String] = []
    var contactsData: [String] = []
    var viewModel: SearchViewModel = SearchViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configSearchBar()
        loadData()
    }

    private func loadData() {
        HUD.show()
        let group = DispatchGroup()
        group.enter()
        loadSearchVideoData {
            group.leave()
        }
        group.notify(queue: .main) {
            HUD.dismiss()
            self.tableView.reloadData()
        }
    }

    private func loadSearchVideoData(completion: @escaping () -> Void ) {
        viewModel.loadSearchVideoAPI { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    completion()
                case .failure(let error):
                    print("error\(error)")
                }
            }
        }
    }

    private func configTableView() {
        let nib = UINib(nibName: "SearchCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "SearchCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func configSearchBar() {
        searchBar.delegate = self
    }

    private func search(keyword: String) {
        contacts = getContacts(keyword: keyword)
        tableView.reloadData()
    }

    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return contactsData
        } else {
            var data: [String] = []
            for contact in contactsData {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
}

extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension SearchViewController: UITableViewDelegate {
}

extension SearchViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}
