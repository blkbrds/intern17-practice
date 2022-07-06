//
//  RegionViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/1/22.
//

import UIKit

protocol RegionViewControllerDelegate: AnyObject {
    func controller(_ controller: RegionViewController, region: Int, province: Int ,district: Int)
}

final class RegionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var region: Int = 0
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
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions
extension RegionViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "Miền \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        let backgroundView = UIView()
        backgroundView.backgroundColor = .blue
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        region = indexPath.row + 1
        print("Miền \(indexPath.row + 1)")
    }
}

extension RegionViewController: ProvinceViewControllerDelegate {
    func controller(_ controller: ProvinceViewController, province: Int, district: Int) {
        delegate?.controller(self, region: region, province: province, district: district)
    }
}
