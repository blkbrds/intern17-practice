//
//  LocationViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/1/22.
//

import UIKit

struct dataLocation {
    var region: String = ""
    var province: String = ""
    var district: String = ""
}

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
        configUI()
    }
    
    // MARK: - Private method
    private func configUI() {
        title = "Địa điểm"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEdit))
        navigationItem.rightBarButtonItem = editButton
    }

    // MARK: - objc
    @objc private func handleEdit() {
        let regionVC = RegionViewController()
        regionVC.delegateRegion = self
        regionVC.region = region
        regionVC.province = province
        regionVC.district = district
        navigationController?.pushViewController(regionVC, animated: true)
    }
}

extension LocationViewController: RegionViewControllerDelegate {
    func controller(_ controller: RegionViewController, needPerformAction action: RegionViewController.Action) {
        switch action {
        case .passDataRegion(let value) :
            region = value.region
            province = value.province
            district = value.district
        }
    }
}
