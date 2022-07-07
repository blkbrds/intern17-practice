import UIKit

final class LocationViewController: UIViewController {
    
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var provinceLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    
    private var districtData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Địa Điểm"
        
        let regionViewController = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInside(_:)))
        navigationItem.rightBarButtonItem = regionViewController
        let regionView = RegionViewController()
        regionView.delegate = self
    }
    
    @objc private func editButtonTouchUpInside(_ sender: UIButton) {
        let regionViewController = RegionViewController()
        regionViewController.delegate = self
        navigationController?.pushViewController(regionViewController, animated: true)
    }
}

extension LocationViewController: RegionViewControllerDelegate {
    func vc(_ vc: RegionViewController, needsPerform action: RegionViewController.Action) {
        switch action{
        case .regionDidTaped(let value):
            guard let value1 = value.region,
                  let value2 = value.province,
                  let value3 = value.district else {
                return
            }
            provinceLabel.text = "Tỉnh \(value2 + 1)"
            regionLabel.text = "Miền \(value1 + 1)"
            districtLabel.text = "Huyện \(value3 + 1)"
        }
    }
}
