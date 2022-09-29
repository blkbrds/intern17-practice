//
//  Bai10ViewController.swift
//  TableView
//
//  Created by luong.tran on 19/09/2022.
//

import UIKit

final class Bai10ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    var viewModel: Bai10ViewModel?
    
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
    
}

extension Bai10ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.arraySectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return  0 }
        let elementKey = viewModel.arraySectionTitles[section]
        if let elementValues = viewModel.arrayListIndex[elementKey] {
            return elementValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Define.cellName, for: indexPath)
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let viewModel = viewModel else { return "" }
        return viewModel.arraySectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        guard let viewModel = viewModel else { return [] }
        return viewModel.arraySectionTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension Bai10ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let viewModel = viewModel else { return }
        viewModel.arrayListIndex.removeAll()
        viewModel.arraySectionTitles.removeAll()
        viewModel.contacts = viewModel.contactsData.filter({text in
            return text.lowercased().contains(searchText.lowercased())
        } )
        if viewModel.contacts.count == 0 {
            viewModel.getFirstCharacter(array: viewModel.contactsData)
        } else {
            viewModel.getFirstCharacter(array: viewModel.contacts)
        }
        tableView.reloadData()
    }
}

extension Bai10ViewController {
    private struct Define {
        static var cellName: String = "tableViewContact"
    }
}
