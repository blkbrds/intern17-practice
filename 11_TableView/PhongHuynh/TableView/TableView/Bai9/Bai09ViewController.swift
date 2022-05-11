import UIKit

final class Bai09ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var garden: [[String]] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "ContactTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "ContactTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "GardenData", withExtension: "plist") else { return }
        guard let contactsData = NSDictionary(contentsOf: path),
              let array1 = contactsData["Section1"] as? [String],
              let array2 = contactsData["Section2"] as? [String],
              let array3 = contactsData["Section3"] as? [String]
        else { return }
        self.garden = [array1, array2, array3]
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension Bai09ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return garden.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garden[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        cell.updateTableCell(avatar: "husky.jpeg", contactName: garden[indexPath.section][indexPath.row], subtitle: "Subtitle", button: "imgName")
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let contactDetailViewController = ContactDetailViewController()
        contactDetailViewController.contactname = garden[indexPath.section][indexPath.row]
        navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Gia Súc"
        case 1: return "Đồ Vật"
        default: return "Tên"
        }
    }
}

// MARK: - ContactTableViewCellDelegate
extension Bai09ViewController: ContactTableViewCellDelegate {
    func makeCall(view: ContactTableViewCell) {
        print("Make")
    }
}
