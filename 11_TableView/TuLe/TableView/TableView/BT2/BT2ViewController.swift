import UIKit

final class BT2ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var names: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        loadData()
        configTableView()
    }
    
    private func configUI() {
        title = "Home"
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "names", withExtension: "plist") else { return }
        guard let nameData = NSArray(contentsOf: path) as? [String] else { return }
        names = nameData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BT2ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.name = names[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
