//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by tri.nguyen on 22/04/2022.
//

import UIKit

final class ProvinceViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var provinceButtons: [UIButton]!
    
    // MARK: - Properties
    var location: Location?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Province"
        let districBarButtonItem = UIBarButtonItem(title: "District", style: .plain, target: self, action: #selector(districtAction))
        navigationItem.rightBarButtonItem = districBarButtonItem
    }
    
    private func changeColer(tag: Int) {
        for province in provinceButtons  {
            province.backgroundColor = province.tag == tag ? .green : .white
        }
    }
        
    // MARK: - Objc
    @objc private func districtAction() {
        let vc = DistrictViewController()
        vc.location = location
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - IBAction
    @IBAction private func changeColorButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        location?.province = sender.tag
    }
}
