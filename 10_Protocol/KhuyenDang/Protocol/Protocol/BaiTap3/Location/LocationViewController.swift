//
//  LocationViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/1/22.
//

import UIKit

final class LocationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var provinceLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    
    // MARK: - Properties
    var region: String = ""
    var province: String = ""
    var district: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private method
    private func configUI() {
        title = "Địa điểm"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEdit))
        navigationItem.rightBarButtonItem = editButton
        regionLabel.text = region
        provinceLabel.text = province
        districtLabel.text = district
    }
    
    // MARK: - objc
    @objc private func handleEdit() {
        let regionVC = RegionViewController()
        regionVC.region = region
        navigationController?.pushViewController(regionVC, animated: true)
    }
}

