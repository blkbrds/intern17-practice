//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/1/22.
//

import UIKit

protocol ProvinceViewControllerDelegate: AnyObject {
    func controller(_ controller:ProvinceViewController, needPerformAction action: ProvinceViewController.Action)
}

final class ProvinceViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var provinceTableView: UITableView!
    
    // MARK: - Properties
    enum Action {
        case passDataProvince(province: String, district: String)
    }
    var province: String = ""
    weak var delegateProvince: ProvinceViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Private method
    private func configTableView() {
        title = "Tỉnh"
        let districtButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(handleDisTrictButton))
        navigationItem.rightBarButtonItem = districtButton
        provinceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        provinceTableView.dataSource = self
        provinceTableView.delegate = self
    }
    
    // MARK: - Objc
    @objc private func handleDisTrictButton() {
        let districtVC = DistrictViewController()
        districtVC.delegate = self
        navigationController?.pushViewController(districtVC, animated: true)
    }
}

// MARK: - Extension
extension ProvinceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "Tỉnh \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = .green
        cell.selectedBackgroundView = backgroundColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        province = "Tỉnh \(indexPath.row + 1)"
    }
}

extension ProvinceViewController: DistrictViewControllerDelegate {
    func controller(_ controller: DistrictViewController, needPerformAction action: DistrictViewController.Action) {
        switch action {
        case .passDataDistrict(district: let district):
            delegateProvince?.controller(self, needPerformAction: .passDataProvince(province: province, district: district))
        }
    }
}
