import UIKit

final class ContactsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var contacts: [String] = []

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }

    // MARK: - Private functions
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String] else { return }
        contacts = contactsData
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate  = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row])"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactsDetailViewController = ContactDetailViewController()
        contactsDetailViewController.contactname = contacts[indexPath.row]
        navigationController?.pushViewController(contactsDetailViewController, animated: true)
    }
}
