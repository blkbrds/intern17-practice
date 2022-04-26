import UIKit

final class Bai10ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var filteredData: [String] = []
    
    
    // MARK: - Properties
    var garden: [[String]] = []
    var gardenIndex: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SECTIONS"
        loadData()
        configTableView()
        searchBar.delegate = self
    }
    
    // MARK: - Private funtions
    private func loadData() {
        let giasuc: [String] = ["Heo", "Bò", "Trâu", "Ngựa", "Gà", "Vịt", "Cá", "Heo", "Bò", "Trâu", "Ngựa", "Gà", "Vịt", "Cá"]
        let dovat: [String] = ["Tivi", "Dao", "Kéo", "Xe", "Chén","Tivi", "Dao", "Kéo", "Xe", "Chén", "Tivi", "Dao", "Kéo", "Xe", "Chén"]
        let ten: [String] = ["Phong", "Tinh", "Thuan", "Tri", "Thong", "Phong", "Tinh", "Thuan", "Tri", "Thong"]
        self.garden = [giasuc, dovat, ten]
        gardenIndex = ["G", "Đ", "T"]
    //    gardenIndex = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"]
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
}

extension Bai10ViewController: UITableViewDataSource, UISearchBarDelegate {
    
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
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Gia Súc"
        case 1: return "Đồ Vật"
        default: return "Tên"
        }
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        garden = searchText.isEmpty ? garden : garden.filter({(dataString: String) -> Bool in
//            return dataString.range(of: searchText, options: .caseInsensitive) != nil
//        })
//        tableView.reloadData()
//    }
    
    
}

