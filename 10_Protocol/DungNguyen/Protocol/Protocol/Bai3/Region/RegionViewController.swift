//
//  RegionViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/1/22.
//

import UIKit

protocol RegionViewControllerDelegate: AnyObject {
    func controller(_ controller: RegionViewController, region: String, province: String ,district: String)
}

final class RegionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var regions: [String] = ["Miền 1", "Miền 2", "Miền 3", "Miền 4", "Miền 5", "Miền 6", "Miền 7", "Miền 8", "Miền 9", "Miền 10"]
    var region: String = ""
    var province: String = ""
    var district: String = ""
    weak var delegate: RegionViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
  
    // MARK: - Private functions
    private func configView(){
        title = "Miền"
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        let provinceButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(provinceAction))
        navigationItem.rightBarButtonItem = provinceButton
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Objc functions
    @objc private func provinceAction() {
        let vc = ProvinceViewController()
        vc.delegate = self
        vc.province = province
        vc.district = district
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions
extension RegionViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = regions[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.selectionStyle = .none
        let selectionIndex = regions.firstIndex(of: region)
        cell.backgroundColor = indexPath.row == selectionIndex ? .blue : .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
        region = regions[indexPath.row]
    }
}

extension RegionViewController: ProvinceViewControllerDelegate {
    func controller(_ controller: ProvinceViewController, province: String, district: String) {
        delegate?.controller(self, region: region, province: province, district: district)
    }
}
