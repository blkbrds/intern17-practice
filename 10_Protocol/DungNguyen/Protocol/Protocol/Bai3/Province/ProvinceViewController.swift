//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/1/22.
//

import UIKit

protocol ProvinceViewControllerDelegate: AnyObject {
    func controller(_ controller: ProvinceViewController, province: Int ,district: Int)
}

final class ProvinceViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var provinceTableView: UITableView!
    
    // MARK: - Properties
    var province: Int = 0
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
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions
extension ProvinceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "Tỉnh \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .black
        let backgroundView = UIView()
        backgroundView.backgroundColor = .green
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        province = indexPath.row + 1
        print("Tỉnh \(indexPath.row + 1)")
    }
}

extension ProvinceViewController: DistrictViewControllerDelegate {
    func controller(_ controller: DistrictViewController, district: Int) {
        delegate?.controller(self, province: province, district: district)
    }
}


