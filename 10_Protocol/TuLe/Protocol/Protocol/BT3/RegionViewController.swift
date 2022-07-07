import UIKit

protocol RegionViewControllerDelegate: AnyObject {
    func vc(_ vc: RegionViewController, needsPerform action: RegionViewController.Action)
}

final class RegionViewController: UIViewController {
    
    enum Action {
        case regionDidTaped(value: SaveData)
    }
    
    @IBOutlet private weak var regionTableView: UITableView!
    
    weak var delegate: RegionViewControllerDelegate?
    private var selectedIndex: IndexPath?
    private var dataFromProvinceView: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Miền"
        regionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "RegionTableViewCell")
        regionTableView.dataSource = self
        regionTableView.delegate = self
        let Province = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(districtButtonTouchUpInside(_:)))
        navigationItem.rightBarButtonItem = Province
    }
    
    @objc private func districtButtonTouchUpInside(_ sender: UIButton) {
        let provinceViewController = ProvinceViewController()
        provinceViewController.delegate = self
        navigationController?.pushViewController(provinceViewController, animated: true)
    }
    
}

extension RegionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegionTableViewCell", for: indexPath)
        cell.textLabel?.text = "Miền \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        if selectedIndex == indexPath {
            cell.backgroundColor = UIColor.blue
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

extension RegionViewController: ProvinceViewControllerDelegate {
    func vc(_ vc: ProvinceViewController, needsPerform action: ProvinceViewController.Action) {
        switch action{
        case .provindeDidTaped(let value):
            delegate?.vc(self, needsPerform: .regionDidTaped(value: SaveData(district: value.district, province: value.province, region: selectedIndex?.row ?? 0)))
        }
    }
}

