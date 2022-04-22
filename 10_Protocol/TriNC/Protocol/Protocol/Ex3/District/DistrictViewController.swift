//
//  DistrictViewController.swift
//  Protocol
//
//  Created by tri.nguyen on 22/04/2022.
//

import UIKit

final class DistrictViewController: UIViewController, LocationDatasource {
    
    // MARK: - IBOutlets
    @IBOutlet private var districtsButtons: [UIButton]!
    
    // MARK: - Properties
    var location: Location?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "District"
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneBarButtonItem
    }
    
    private func changeColer(tag: Int) {
        for district in districtsButtons  {
            district.backgroundColor = district.tag == tag ? .orange : .white
        }
    }
    
    // MARK: - Public Functions
    func getLocation() -> Location {
        guard let location = location else {
            return Location(region: 0, province: 0, district: 0)
        }
        return location
    }
    
    // MARK: - Objc
    @objc private func doneAction() {
        guard let navigation = navigationController else  { return }
        if let vc = navigation.viewControllers[0] as? LocationViewController {
            vc.datasource = self
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func changweColor(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        location?.district = sender.tag
    }
}
