import UIKit

protocol ProvinceViewControllerDelegate: AnyObject {
    func vc(_ vc: ProvinceViewController, needsPerform action: ProvinceViewController.Action)
}

final class ProvinceViewController: UIViewController {

    enum Action {
        case provindeDidTaped(data: SaveData)
    }
    
    @IBOutlet private weak var provinceTableView: UITableView!
    
    private var selectedIndex: IndexPath?
    weak var delegate: ProvinceViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        provinceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProvinceTableViewCell")
        provinceTableView.delegate = self
        provinceTableView.dataSource = self
        title = "Tỉnh"
        
            let districtViewController = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(districtButtonTouchUpInside(_:)))
            navigationItem.rightBarButtonItem = districtViewController
    }
    
    @objc private func districtButtonTouchUpInside(_ sender: UIButton) {
        let districtViewController = DistrictViewController()
        districtViewController.delegate = self
        navigationController?.pushViewController(districtViewController, animated: true)
    }
}

extension ProvinceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProvinceTableViewCell", for: indexPath)
        cell.textLabel?.text = "Tỉnh \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        if selectedIndex == indexPath {
            cell.backgroundColor = UIColor.green
            cell.textLabel?.textColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexesToRedraw = [indexPath]
        selectedIndex = indexPath
        tableView.reloadRows(at: indexesToRedraw, with: .fade)
    }
}

extension ProvinceViewController: DistrictViewControllerDelegate {
    func districtView(_ view: DistrictViewController, _ data: Int) {
        let value: SaveData = SaveData(district: data, province: selectedIndex?.row ?? 0)
        delegate?.vc(self, needsPerform: .provindeDidTaped(data: value))
    }
}

struct SaveData {
    var district: Int?
    var province: Int?
    var region: Int?
}
