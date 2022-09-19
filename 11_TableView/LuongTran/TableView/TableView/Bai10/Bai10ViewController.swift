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
    
    private var contactsData: [String] = []
    private var contacts: [String] = []
    private var arrayListIndex: [String: [String]] = [:]
    private var arraySectionTitles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        configTableView()
        configSearchBar()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewContact")
        tableView.dataSource = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "contacts", withExtension: "plist")
        else { return }
        guard let data = NSArray(contentsOf: path) as? [String]
        else { return }
        contactsData = data
        contacts = contactsData
        getFirstCharacter(array: contactsData)
    }

    private func getFirstCharacter(array: [String]) {
        for element in array {
            let elementKey = String(element.prefix(1))
            if var elementValues = arrayListIndex[elementKey] {
                elementValues.append(element)
                arrayListIndex[elementKey] = elementValues
            } else {
                arrayListIndex[elementKey] = [element]
            }
        }
        arraySectionTitles = [String](arrayListIndex.keys)
        arraySectionTitles = arraySectionTitles.sorted(by: { $0 < $1 })
    }
    
}

extension Bai10ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let elementKey = arraySectionTitles[section]
        if let elementValues = arrayListIndex[elementKey] {
            return elementValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewContact", for: indexPath)
        let elementKey = arraySectionTitles[indexPath.section]
        if let elementValues = arrayListIndex[elementKey] {
            cell.textLabel?.text = "\(elementValues[indexPath.row])"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arraySectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arraySectionTitles
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
        arrayListIndex.removeAll()
        arraySectionTitles.removeAll()
        contacts = contactsData.filter({text in
            return text.lowercased().contains(searchText.lowercased())
        } )
        if contacts.count == 0 {
            getFirstCharacter(array: contactsData)
        } else {
            getFirstCharacter(array: contacts)
        }
        self.tableView.reloadData()
    }
}
