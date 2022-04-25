import UIKit

// MARK: - Bai05ViewControllerDatasource
protocol Bai05ViewControllerDatasource: class {
    func controller() -> [String]
}

final class Bai05ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var filteredData: [String] = []
    var array: [String] = ["Nguyễn Văn Tèo", "Lê Thị Lung Linh", "Trần Trẻ Trung", "Lý Líu Lo", "Mộng Thị Mơ", "Chí Văn Phèo", "Hoàng Hí Hửng", "Võ Vênh Váo", "Mai Văn Mốt", "Nguyễn Văn Tếu"]
    weak var datasource: Bai05ViewControllerDatasource?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        filteredData = array
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
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? array : array.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableView.reloadData()
    }
}
