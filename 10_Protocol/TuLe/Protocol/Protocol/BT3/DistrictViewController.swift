import UIKit

protocol DistrictViewControllerDelegate: AnyObject {
    func districtView(_ view: DistrictViewController, _ data: Int)
}

final class DistrictViewController: UIViewController {
    
    @IBOutlet private weak var districtTableView: UITableView!
    
    private var selectedIndex: IndexPath?
    weak var delegate: DistrictViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        districtTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DistrictTableViewCell")
        districtTableView.delegate = self
        districtTableView.dataSource = self
        title = "Tỉnh"
        
        let districtViewController = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInside(_:)))
        navigationItem.rightBarButtonItem = districtViewController
    }
    
    @objc private func doneButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
        delegate?.districtView(self, selectedIndex?.row ?? 0)
    }
    
}

extension DistrictViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DistrictTableViewCell", for: indexPath)
        cell.textLabel?.text = "Huyện \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        if selectedIndex == indexPath {
            cell.backgroundColor = UIColor.orange
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
