//
//  LocationViewController.swift
//  Protocol
//
//  Created by tri.nguyen on 22/04/2022.
//

import UIKit

// MARK: - Protocol DataSource
protocol LocationDatasource: class {
    func getLocation() -> Location
}

final class LocationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var provinceLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    
    // MARK: - Properties
    weak var datasource: LocationDatasource?
    var location: Location = Location(region: 0, province: 0, district: 0)
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupBarItem()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        title = "Location"
        guard let location = datasource?.getLocation() else { return }
        regionLabel.text = "Region: \(location.region)"
        regionLabel.textColor = .blue
        provinceLabel.text = "Province: \(location.province)"
        provinceLabel.textColor = .green
        districtLabel.text = "district: \(location.district)"
        districtLabel.textColor = .orange
    }
    
    private func setupBarItem() {
        let editBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonAction))
        navigationItem.rightBarButtonItem = editBarButtonItem
    }
    
    // MARK: - Objc
    @objc private func editButtonAction() {
        let vc = RegionViewController()
        vc.location = location
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
