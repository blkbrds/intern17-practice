import UIKit

final class Bai08ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var garden: [[String]] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigationBar()
        loadData()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Contacts"
        turnOffEditingMode()
    }
    
    private func loadData() {
        let giasuc: [String] = ["Heo", "Bò", "Trâu", "Ngựa", "Gà", "Vịt"]
        let dovat: [String] = ["Tivi", "Dao", "Kéo", "Xe", "Chén","Tivi", "Dao", "Kéo", "Xe", "Chén", "Tivi", "Dao", "Kéo", "Xe", "Chén"]
        let ten: [String] = ["Phong", "Tinh", "Thuan", "Tri", "Thong", "Phong", "Tinh", "Thuan", "Tri", "Thong"]
        self.garden = [giasuc, dovat, ten]
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
    
    // MARK: - Objc functions
    @objc private func turnOnEditingMode() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func turnOffEditingMode() {
        tableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItem = editButton
    }
}

// MARK: - UITableViewDataSource
extension Bai08ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return garden.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garden[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = garden[indexPath.section][indexPath.row]
        let lable = UILabel(frame: CGRect(x: 45, y: 15, width: 100, height: 50))
        lable.text = "name"
        lable.textColor = .red
        cell.addSubview(lable)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Gia Súc"
        case 1: return "Đồ Vật"
        default: return "Tên"
        }
    }
}
