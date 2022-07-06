//
//  LocationViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/1/22.
//

import UIKit

final class LocationViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var provinceLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    
    // MARK: - Properties
    var region: Int = 1 {
        didSet {
            regionLabel.text = "Miền \(region)"
        }
    }
    var province: Int = 1 {
        didSet {
            provinceLabel.text = "Tỉnh \(province)"
        }
    }
    var district: Int = 1 {
        didSet {
            districtLabel.text = "Huyện \(district)"
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }

    // MARK: - Private functions
    private func configView(){
        title = "Địa điểm"
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
        
        regionLabel.text = "Miền \(region)"
        provinceLabel.text = "Tỉnh \(province)"
        districtLabel.text = "Huyện \(province)"
    }
    
    // MARK: - Objc functions
    @objc private func editAction() {
        let vc = RegionViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions
extension LocationViewController: RegionViewControllerDelegate {
    func controller(_ controller: RegionViewController, region: Int, province: Int, district: Int) {
        self.region = region
        self.province = province
        self.district = district
        print(region, province, district)
    }
}

