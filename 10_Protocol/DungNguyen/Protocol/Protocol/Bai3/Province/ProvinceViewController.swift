//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/1/22.
//

import UIKit

protocol ProvinceViewControllerDelegate: AnyObject {
    func controller(_ controller: ProvinceViewController, province: String ,district: String)
}

final class ProvinceViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var provinceTableView: UITableView!
    
    // MARK: - Properties
    var provinces: [String] = ["Tỉnh 1", "Tỉnh 2", "Tỉnh 3", "Tỉnh 4", "Tỉnh 5", "Tỉnh 6", "Tỉnh 7", "Tỉnh 8", "Tỉnh 9", "Tỉnh 10"]
    var province: String = ""
    var district: String = ""
    weak var delegate: ProvinceViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }

    // MARK: - Private functions
    private func configView(){
        title = "Tỉnh"
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        let districtButton = UIBarButtonItem(title: "Miền", style: .plain, target: self, action: #selector(districtAction))
        navigationItem.rightBarButtonItem = districtButton
        provinceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        provinceTableView.dataSource = self
        provinceTableView.delegate = self
    }
    
    // MARK: - Objc functions
    @objc private func districtAction() {
        let vc = DistrictViewController()
        vc.delegate = self
        vc.district = district
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions
extension ProvinceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provinces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = provinces[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .black
        cell.selectionStyle = .none
        let selectionIndex = provinces.firstIndex(of: province)
        cell.backgroundColor = indexPath.row == selectionIndex ? .green : .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
        province = provinces[indexPath.row]
    }
}

extension ProvinceViewController: DistrictViewControllerDelegate {
    func controller(_ controller: DistrictViewController, district: String) {
        delegate?.controller(self, province: province, district: district)
    }
}


