//
//  Bai10ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/23/22.
//

import UIKit
import ContactsUI

final class Bai10ViewController: UIViewController {
    
    // MARK: - Property
    var baseData: [String] = []
    var titles = [String]()
    var valueDictionary = [String: [String]]()
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Danh Ba"
        configTableView()
        configSearchBar()
        getContact()
        getKey()
        searchBar.showsCancelButton = true
    }
    
    // MARK: - Private function
    private func getContact() {
        baseData.removeAll()
        var contacts = [CNContact]()
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        let contactStore = CNContactStore()
        do {
            try contactStore.enumerateContacts(with: request) {
                (contact, stop) in
                contacts.append(contact)
                
                let fullName = contact.givenName + " " + contact.familyName
                self.baseData.append(fullName)
            }
        }
        catch {
            print("unable to fetch contacts")
        }
    }
    
    private func getKey() {
        valueDictionary = [:]
        for data in baseData {
            let key  = String(data.prefix(1))
            if var value = valueDictionary[key] {
                value.append(data)
                valueDictionary[key] = value
            } else {
                valueDictionary[key] = [data]
            }
        }
        titles = [String](valueDictionary.keys)
        titles = titles.sorted(by:{$0 < $1})
    }
    
    private  func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func search(keyword: String) {
        baseData = getContacts(keyword: keyword)
        getKey()
        tableView.reloadData()
    }
    
    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            getContact()
            return baseData
        } else {
            var data: [String] = []
            for contact in baseData {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
}

// MARK: - UISearchBarDelegate
extension Bai10ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keywork = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keywork)
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

// MARK: - UITableViewDataSource
extension Bai10ViewController: UITableViewDataSource {
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titles
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int ) -> Int {
        return index
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = titles[section]
        if let cvalue = valueDictionary[key] {
            return cvalue.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key = titles[indexPath.section]
        if let value = valueDictionary[key] {
            cell.textLabel?.text = value[indexPath.row]
        }
        return cell
    }
}
