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
    var region: String = "" {
        didSet {
            regionLabel.text = region
        }
    }
    var province: String = "" {
        didSet {
            provinceLabel.text = province
        }
    }
    var district: String = "" {
        didSet {
            districtLabel.text = district
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
    }
    
    // MARK: - Objc functions
    @objc private func editAction() {
        let vc = RegionViewController()
        vc.delegate = self
        vc.region = region
        vc.province = province
        vc.district = district
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions
extension LocationViewController: RegionViewControllerDelegate {
    func controller(_ controller: RegionViewController, region: String, province: String, district: String) {
        self.region = region
        self.province = province
        self.district = district
    }
}

