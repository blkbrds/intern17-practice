import UIKit
import Contacts

final class Bai10ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var arrayTong: [String] = []
    var arraySection: [String] = []
    var arrayDictionary: [String: [String]] = [:]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SECTIONS"
        
        configTableView()
        searchBar.delegate = self
        contact()
        loadData()
    }
    
    func loadData() {
        for car in arrayTong {
            let carKey = String(car.prefix(1))
            if var carValues = arrayDictionary[carKey] {
                carValues.append(car)
                arrayDictionary[carKey] = carValues
            } else {
                arrayDictionary[carKey] = [car]
            }
        }
        arraySection = [String](arrayDictionary.keys)
        arraySection = arraySection.sorted(by: { $0 < $1 })
    }
    
    func contact() {
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
    
    func retrieveContacts(from store: CNContactStore) {
        var contacts: [CNContact] = []
        let containerId = store.defaultContainerIdentifier()
        let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
        let keysToFetch = [CNContactGivenNameKey as CNKeyDescriptor,
                           CNContactFamilyNameKey as CNKeyDescriptor,
                           CNContactImageDataAvailableKey as
                            CNKeyDescriptor,
                           CNContactImageDataKey as CNKeyDescriptor]
        contacts = try! store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
        for i in contacts {
            arrayTong.append(i.familyName + i.givenName)
        }
    }
    
    // MARK: - Private funtions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
}

extension Bai10ViewController: UITableViewDataSource, UISearchBarDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let carKey = arraySection[section]
        if let carValues = arrayDictionary[carKey] {
            return carValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let carKey = arraySection[indexPath.section]
        if let carValues = arrayDictionary[carKey] {
            cell.textLabel?.text = carValues[indexPath.row]
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        arrayTong = searchText.isEmpty ? arrayTong : arrayTong.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
       tableView.reloadData()
    }
}

