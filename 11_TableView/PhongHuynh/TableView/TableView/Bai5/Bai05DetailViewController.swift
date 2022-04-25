import UIKit

final class Bai05DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchLabel: UILabel!
    
    // MARK: - Properties
    var search: String = ""
    var array: [String]?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        searchLabel.text = search
    }
    
    @objc private func backAction() {
        guard let navi = navigationController else { return }
        if let homevc = navi.viewControllers[0] as? Bai05ViewController {
            homevc.datasource = self
        }
        navi.popToRootViewController(animated: true)
    }
}

// MARK: - Bai05ViewControllerDatasource
extension Bai05DetailViewController: Bai05ViewControllerDatasource {
    func controller() -> [String] {
        guard let array = array else {
            return ["Nguyễn Văn Tèo", "Lê Thị Lung Linh", "Trần Trẻ Trung", "Lý Líu Lo", "Mộng Thị Mơ", "Chí Văn Phèo", "Hoàng Hí Hửng", "Võ Vênh Váo", "Mai Văn Mốt", "Nguyễn Văn Tếu"]
        }
        return array
    }
}
