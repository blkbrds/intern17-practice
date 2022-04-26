import UIKit

class Bai12ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var nameData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        configTableView()
    }
    
    // MARK: - Private functions
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "NameData", withExtension: "plist") else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String] else { return }
        nameData = contactsData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate  = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension Bai12ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(nameData[indexPath.row])"
        return cell
    }
}

extension Bai12ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.nameData.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            completionHandler(true)
        }
        delete.backgroundColor = .red
        // swipe
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let insert = UIContextualAction(style: .normal, title: "insert") { [self] (action, view, completionHandler) in
            tableView.beginUpdates()
            nameData.append("ABC")
            tableView.insertRows(at: [IndexPath(row: self.nameData.count - 1, section: 0)], with: .automatic)
            tableView.endUpdates()
            tableView.reloadData()
            completionHandler(true)
        }
        insert.image = UIImage(named: "insert.png")
        let delete = UIContextualAction(style: .normal, title: "delete") { (action, view, completionHandler) in
            self.nameData.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            completionHandler(true)
        }
        delete.image = UIImage(named: "delete.jpeg")
        let swipe = UISwipeActionsConfiguration(actions: [insert, delete])
        return swipe
    }
}
