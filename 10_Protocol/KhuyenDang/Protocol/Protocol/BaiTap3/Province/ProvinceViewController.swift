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
        case passDataProvince(value: dataLocation)
    }
    var provinces: [String] = ["Tỉnh 1", "Tỉnh 2","Tỉnh 3","Tỉnh 4","Tỉnh 5", "Tỉnh 6", "Tỉnh 7", "Tỉnh 8", "Tỉnh 9", "Tỉnh 10"]
    var province: String = ""
    var district: String = ""
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
        districtVC.district = district
        navigationController?.pushViewController(districtVC, animated: true)
    }
}

// MARK: - Extension
extension ProvinceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provinces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = provinces[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.selectionStyle = .none
        let selectedIndex = provinces.firstIndex(of: province)
        cell.backgroundColor = indexPath.row == selectedIndex ? .green : .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
        province =  provinces[indexPath.row]
    }
}

extension ProvinceViewController: DistrictViewControllerDelegate {
    func controller(_ controller: DistrictViewController, needPerformAction action: DistrictViewController.Action) {
        switch action {
        case .passDataDistrict(let value):
            let valueProvince = dataLocation(province: province, district: value.district)
            delegateProvince?.controller(self, needPerformAction: .passDataProvince(value: valueProvince))
        }
    }
}
