import UIKit

final class BT4ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var names: NSArray?
    var names1: [String] = []
    let cell: String = "tableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "bt4List", withExtension: "plist") else { return }
        guard let nameData = NSArray(contentsOf: path) else {
            return
        }
        
        names = nameData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BT4ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let names = names else {
            return 1
        }
        return names.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names1 = names?[section] as? [String] ?? []
        return names1.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        cell.textLabel?.text = names1[indexPath.row]
        return cell
    }
}
