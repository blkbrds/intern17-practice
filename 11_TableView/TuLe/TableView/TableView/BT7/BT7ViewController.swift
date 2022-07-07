import UIKit

final class BT7ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var garden: [[String]] = []
    var gardenIndex: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Section"
        loadData()
        configTableView()
    }
    
    private func loadData() {
        let cattle: [String] = ["Heo", "Bò", "Trâu", "Ngựa", "Gà", "Vịt", "Cá"]
        let pest: [String] = ["Tivi", "Dao", "Kéo", "Xe", "Chén"]
        let car: [String] = ["Tivi", "Dao", "Kéo", "Xe", "Chén"]
        garden = [cattle, pest, car]
        gardenIndex = ["G", "P", "C"]
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "BT7TableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "BT7TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BT7ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        garden.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Gia Súc"
        case 1:
            return "Đồ Vật"
        default:
            return "Xe"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        garden[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BT7TableViewCell", for: indexPath) as! BT7TableViewCell
        cell.updateTableCell(name: garden[indexPath.section][indexPath.row], avatar: "avt", index: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

extension BT7ViewController: BT7TableViewCellDelegate {
    func view(vc: UITableViewCell, needPerform action: BT7TableViewCell.Action) {
        switch action {
        case .buttonTapped(data: let data):
            print(data)
        }
    }
}
