//
//  RegionViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/1/22.
//

import UIKit

protocol RegionViewControllerDelegate: AnyObject {
    func controller(_ controller: RegionViewController, needPerformAction action: RegionViewController.Action)
}

final class RegionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var regionTableView: UITableView!
    
    // MARK: - Properties
    enum Action {
        case passDataRegion(value: dataLocation)
    }
    weak var delegateRegion: RegionViewControllerDelegate?
    private var selectedIndexPath: IndexPath?
    var regions: [String] = ["Miền 1", "Miền 2","Miền 3","Miền 4","Miền 5", "Miền 6", "Miền 7", "Miền 8", "Miền 9", "Miền 10"]
    var region: String = ""
    var province: String = ""
    var district: String = ""
    
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
        provinceVC.province = province
        provinceVC.district = district
        navigationController?.pushViewController(provinceVC, animated: true)
    }
}

// MARK: - Extension
extension RegionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = regions[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.layer.cornerRadius = 10
        cell.selectionStyle = .none
        let selectedIndex = regions.firstIndex(of: region)
        cell.backgroundColor = indexPath.row == selectedIndex ? .blue : .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.reloadData()
        region =  regions[indexPath.row]
    }
}

extension RegionViewController: ProvinceViewControllerDelegate {
    func controller(_ controller: ProvinceViewController, needPerformAction action: ProvinceViewController.Action) {
        switch action {
        case .passDataProvince(let value):
            let valueRegion = dataLocation(region: region, province: value.province, district: value.district)
            delegateRegion?.controller(self, needPerformAction: .passDataRegion(value: valueRegion))
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

