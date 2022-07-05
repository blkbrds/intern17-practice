//
//  RegionViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/1/22.
//

import UIKit

final class RegionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var regionTableView: UITableView!
    
    // MARK: - Properties
    var region: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Private method
    private func configTableView() {
        title = "Miền"
        let provinceButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(handleProvinceButton))
        navigationItem.rightBarButtonItem = provinceButton
        regionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        regionTableView.dataSource = self
        regionTableView.delegate = self
    }
    
    // MARK: - Objc
    @objc private func handleProvinceButton() {
        let provinceVC = ProvinceViewController()
        provinceVC.delegateProvince = self
        navigationController?.pushViewController(provinceVC, animated: true)
    }
}

// MARK: - Extension
extension RegionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "Miền \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.layer.cornerRadius = 10
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = .blue
        cell.selectedBackgroundView = backgroundColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        region =  "Miền \(indexPath.row + 1)"
    }
}

extension RegionViewController: ProvinceViewControllerDelegate {
    func controller(_ controller: ProvinceViewController, needPerformAction action: ProvinceViewController.Action) {
        switch action {
        case .passDataProvince(province: let province, district: let district):
            let locationViewController = LocationViewController()
            locationViewController.region = region
            locationViewController.province = province
            locationViewController.district = district
            navigationController?.pushViewController(locationViewController, animated: true)
        }
    }
}

