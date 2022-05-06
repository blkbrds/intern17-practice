//
//  TableViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/29/22.
//

import UIKit
import Contacts

final class TableViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var contactsData: [String] = [] // Fix data
    private var contacts: [String] = [] // For filtering
    private var contactIndexes: [String] = []
    private var contactDictionary: [String: [String]] = [:] // Data by sections
    private var isSearching: Bool = false {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configSearchBar()
        configNavigationBar()
        fetchContacts()
        getIndexesForSections()
    }
    
    //MARK: - Private config funtions
    private func configNavigationBar() {
        self.title = "Danh bạ"
        turnOffEdittingMode()
        
        let ex11 = UIBarButtonItem(title: "EX 11", style: .plain, target: self, action: #selector(goToViewController))
        navigationItem.leftBarButtonItem = ex11
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func fetchContacts() {
        let store = CNContactStore()
        let status = CNContactStore.authorizationStatus(for: .contacts)
        switch status {
        case .notDetermined:
            let alertControler = UIAlertController(title: "Warning", message: "Cannot access Contacts", preferredStyle: .alert)
            present(alertControler, animated: true, completion: nil)
            
        case .restricted:
            let alertControler = UIAlertController(title: "Warning", message: "Cannot access Contacts", preferredStyle: .alert)
            present(alertControler, animated: true, completion: nil)
            
        case .denied: // Gotosetting
            let alertControler = UIAlertController(title: "Warning", message: "Cannot access Contacts", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Go to Setting", style: .default) { _ in
                guard let settingURL = URL(string: UIApplication.openSettingsURLString) else { return }
                UIApplication.shared.open(settingURL)
            }
            alertControler.addAction(alertAction)
            present(alertControler, animated: true, completion: nil)
            
        case .authorized:
            store.requestAccess(for: .contacts) { (granted, error) in
                if let error = error {
                    print("failed to request access", error)
                    return
                }
                if granted {
                    let keys = [CNContactGivenNameKey, CNContactFamilyNameKey]
                    let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                    do {
                        try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                            self.contacts.append("\(contact.givenName + " " +  contact.familyName)")
                        })
                    } catch let error {
                        print("Failed to enumerate contact", error)
                    }
                } else {
                    print("access denied")
                }
                self.contactsData = self.contacts
            }
        @unknown default:
            fatalError()
        }
    }
    
    private func getIndexesForSections() {
        var indexArray: [String] = []
        // Get indexes for sections
        contactsData.forEach { indexArray.append("\($0.first!)") }
        contactIndexes = Array(Set(indexArray)).sorted()
        
        // Get contact for each index
        contactIndexes.forEach { element in
            let contactsArray = contactsData.filter { $0.first == Character(element)}
            contactDictionary[element] = contactsArray
        }
    }
    
    // Search contacts functions
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
    
    // Objec C private functions
    @objc private func turnOffEdittingMode() {
        tableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEdittingMode))
        navigationItem.rightBarButtonItems = [editButton]
    }
    
    @objc private func turnOnEdittingMode() {
        tableView.isEditing = true
        let deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteAllContacts))
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEdittingMode))
        navigationItem.rightBarButtonItems = [doneButton, deleteButton]
    }
    
    @objc private func goToViewController() {
        navigationController?.pushViewController(CommentsViewController(), animated: true)
    }
    
    @objc private func deleteAllContacts() {
        contacts.removeAll()
        contactDictionary.removeAll()
        tableView.reloadData()
    }
}


//MARK: - Extention UITableView Delegate and Datasource
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailVC = ContactDetailViewController()
        contactDetailVC.title = !isSearching ? contactDictionary[contactIndexes[indexPath.section]]?[indexPath.row] :
            "\(contacts[indexPath.row])"
        navigationController?.pushViewController(contactDetailVC, animated: true)
    }
}

extension TableViewController: UITableViewDataSource {
    // Define cell of table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = isSearching ? "\(contacts[indexPath.row])" :
            contactDictionary[contactIndexes[indexPath.section]]?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        !isSearching ? contactDictionary[contactIndexes[section]]?.count ?? 0 : contacts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        !isSearching ? contactDictionary.keys.count : 1
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        !isSearching ? contactIndexes : nil
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        isSearching ? nil : contactIndexes[section]
    }
    
    // Leading swipe action
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let insert = UIContextualAction(style: .normal, title: "Add") { (action, view, completion) in
            self.contactDictionary[self.contactIndexes[indexPath.section]]?.append("")
            tableView.reloadData()
        }
        let config = UISwipeActionsConfiguration(actions: [insert])
        return config
    }
}

//MARK: - Extension UISearchBar Delegate
extension TableViewController: UISearchBarDelegate {
    // Search bar functions
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        search(keyword: "")
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyword)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    // User click on search bar
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Delete contacts
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard var array = contactDictionary[contactIndexes[indexPath.section]] else { return }
            array.remove(at: indexPath.row)
            contactDictionary[contactIndexes[indexPath.section]] = array
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    // Reorder row of table view
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
}
