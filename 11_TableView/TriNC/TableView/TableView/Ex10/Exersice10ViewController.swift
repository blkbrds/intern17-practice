//
//  Exersice10ViewController.swift
//  TableView
//
//  Created by tri.nguyen on 26/04/2022.
//

import UIKit
import Contacts

// MARK: Model
struct Contact {
    let name: String
}

final class Exersice10ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var sortedContacts: [String: [Contact]] = [:]
    var keys: [String] = []
    
    var tempArr: [String: [Contact]] = [:]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Contacts"
        // register
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // delegate && datasource
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    private func setupData() {
        fetchContacts()
        tempArr = sortedContacts
    }
    
    // MARK: - Fetch Data
    private func fetchContacts() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, err in
            if let err = err {
                print("Failed to request access", err)
                return
            }
            
            if granted {
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                request.sortOrder = CNContactSortOrder.userDefault
                
                do {
                    try store.enumerateContacts(with: request) { (contact, stopointer ) in
                        let fistChar: String = String(contact.familyName.first ?? Character(""))
                        let contact = Contact(name: contact.familyName + contact.givenName)
                        if self.sortedContacts.keys.contains(String(fistChar)) {
                            var values = self.sortedContacts[fistChar]
                            values?.append(contact)
                            self.sortedContacts[fistChar] = values
                        } else {
                            self.sortedContacts[fistChar] = [contact]
                        }
                    }
                    self.keys = Array(self.sortedContacts.keys)
                    self.keys = self.keys.sorted { $0.lowercased() < $1.lowercased() }
                    self.tableView.reloadData()
                } catch let err {
                    print("Failed to enum contacts", err)
                }
                
            } else {
                print("Denied granted")
            }
        }
    }
}

// MARK: - Extention UITableView Delegate && Datasource
extension Exersice10ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedContacts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        return sortedContacts[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let tableLabel = UILabel(frame: CGRect(x: 30, y: 0, width: 200, height: 50))
        let key = keys[indexPath.section]
        let contacts = sortedContacts[key] ?? []
        let contact = contacts[indexPath.row]
        //tableLabel.text = contact.name
        //cell.addSubview(tableLabel)
        cell.textLabel?.text = contact.name
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            sortedContacts = tempArr
        } else {
            sortedContacts.removeAll()
            
            var namesArray = [Contact]()
            
            for (_, value) in tempArr {
                namesArray += value
            }
            
            let namesFilteredArray = namesArray.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            
            for filteredName in namesFilteredArray {
                let letter = keys.first!
                if sortedContacts[String(letter)] != nil {
                    sortedContacts[String(letter)]?.append(filteredName)
                } else {
                    sortedContacts[String(letter)] = [filteredName]
                }
            }
        }
        tableView.reloadData()
    }
    
}













