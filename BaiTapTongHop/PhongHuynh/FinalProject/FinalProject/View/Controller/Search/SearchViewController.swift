//
//  SearchViewController.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/23/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class SearchViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: SearchViewModel = SearchViewModel()
    let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 60, y: 0, width: 300, height: 20))

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configSearchBar()
        configNavigation()
    }

    // MARK: - Private functions
    private func loadSearchVideoData(keyword: String) {
        viewModel.loadSearchVideoAPI(keyword: keyword) { [weak self] (result) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    this.tableView.reloadData()
                case .failure(let error):
                    this.alert(title: "Error", msg: error.localizedDescription, handler: nil)
                }
            }
        }
    }

    private func configTableView() {
        tableView.register(SearchCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func configSearchBar() {
        searchBar.delegate = self
    }

    private func configNavigation() {
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        searchBar.placeholder = "Tìm kiếm"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.tintColor = UIColor.black
        searchBar.searchBarStyle = .minimal
        navigationItem.leftBarButtonItem = leftNavBarButton
        let rightNavBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.rightBarButtonItem = rightNavBarButton
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.white
    }

    @objc private func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource
@available(iOS 13.0, *)
extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(SearchCell.self)
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = viewModel.viewModelForDetail(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

// MARK: - UITableViewDelegate
@available(iOS 13.0, *)
extension SearchViewController: UITableViewDelegate {
}

// MARK: - UISearchBarDelegate
@available(iOS 13.0, *)
extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else { return }
        loadSearchVideoData(keyword: keyWord.replacingOccurrences(of: " ", with: ""))
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
