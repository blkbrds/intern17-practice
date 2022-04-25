import UIKit

final class Bai04ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var garden: [[String]] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SICTIONS"
        loadData()
        configTableView()
    }
    
    // MARK: - Private functions
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "DataSection0", withExtension: "plist") else { return }
        guard let contactsData = NSDictionary(contentsOf: path),
              let array1 = contactsData["Section1"] as? [String],
              let array2 = contactsData["Section2"] as? [String],
              let array3 = contactsData["Section3"] as? [String]
        else { return }
        self.garden = [array1, array2, array3]
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
    
}

// MARK: - UITableViewDataSource
extension Bai04ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return garden.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garden[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = garden[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Section 0"
        case 1: return "Section 1"
        default: return "Section 2"
        }
    }
}
