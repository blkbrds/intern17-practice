import UIKit

final class Bai05ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var filteredData: [String] = []
    var array: [String] = ["Nguyễn Văn Tèo", "Lê Thị Lung Linh", "Trần Trẻ Trung", "Lý Líu Lo", "Mộng Thị Mơ", "Chí Văn Phèo", "Hoàng Hí Hửng", "Võ Vênh Váo", "Mai Văn Mốt", "Nguyễn Văn Tếu"]
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = array
        configTableView()
        configSearchBar()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate
extension Bai05ViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Bai05DetailViewController()
        vc.search =  filteredData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? array : array.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableView.reloadData()
    }
}

// MARK: - Bai05DetailViewControllerDelegate
extension Bai05ViewController: Bai05DetailViewControllerDelegate {
    
    func controler(view: Bai05DetailViewController, needsPerfom actions: Bai05DetailViewController.Action) {
        switch actions {
        case .reload:
            tableView.reloadData()
        }
    }
}
