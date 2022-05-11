import UIKit
import Contacts

final class Bai10ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var arrayTong: [String] = []
    var arraySection: [String] = []
    var arrayDictionary: [String: [String]] = [:]

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        searchBar.delegate = self
        contact()
        configData()
        configSearchBar()
    }
    
    // MARK: - Private functions
    private func configData() {
        for array in arrayTong {
            let arrayKey = String(array.prefix(1))
            if var arrayValues = arrayDictionary[arrayKey] {
                arrayValues.append(array)
                arrayDictionary[arrayKey] = arrayValues
            } else {
                arrayDictionary[arrayKey] = [array]
            }
        }
        arraySection = [String](arrayDictionary.keys)
        arraySection = arraySection.sorted(by: { $0 < $1 })
    }
    
    private func contact() {
        let store = CNContactStore()
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        if authorizationStatus == .notDetermined {
            store.requestAccess(for: .contacts) { [weak self] didAuthorize, error in
                if didAuthorize {
                    self?.retrieveContacts(from: store)
                }
            }
        } else if authorizationStatus == .authorized {
            retrieveContacts(from: store)
        }
    }
    
    private func retrieveContacts(from store: CNContactStore) {
        var contacts: [CNContact] = []
        let containerId = store.defaultContainerIdentifier()
        let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
        let keysToFetch = [CNContactGivenNameKey as CNKeyDescriptor,
                           CNContactFamilyNameKey as CNKeyDescriptor,
                           CNContactImageDataAvailableKey as
                            CNKeyDescriptor,
                           CNContactImageDataKey as CNKeyDescriptor]
        contacts = try! store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
        for contact in contacts {
            arrayTong.append(contact.familyName + " " + contact.givenName)
        }
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }

    private func search(keyword: String) {
        arrayTong = getContacts(keyword: keyword)
        arraySection = []
        arrayDictionary = [:]
        configData()
        tableView.reloadData()
    }
    
    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return arrayTong
        } else {
            var data: [String] = []
            for contact in arrayTong {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
}

// MARK: - UITableViewDataSource
extension Bai10ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrayKey = arraySection[section]
        if let arrayValues = arrayDictionary[arrayKey] {
            return arrayValues.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let arrayKey = arraySection[indexPath.section]
        if let arrayValues = arrayDictionary[arrayKey] {
            cell.textLabel?.text = arrayValues[indexPath.row]
        }
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arraySection
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arraySection[section]
    }
}

// MARK: - UISearchBarDelegate
extension Bai10ViewController: UISearchBarDelegate {
    
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
        arrayTong = []
        arraySection = []
        arrayDictionary = [:]
        contact()
        search(keyword: "")
    }
}
