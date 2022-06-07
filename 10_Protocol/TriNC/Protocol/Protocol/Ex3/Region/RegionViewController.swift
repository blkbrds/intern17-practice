//
//  RegionViewController.swift
//  Protocol
//
//  Created by tri.nguyen on 22/04/2022.
//

import UIKit

final class RegionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var regionButtons: [UIButton]!
    
    // MARK: - Properties
    var location: Location?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Region"
        let regionBarButtonItem = UIBarButtonItem(title: "Province", style: .plain, target: self, action: #selector(regionAction))
        navigationItem.rightBarButtonItem = regionBarButtonItem
    }
    
    // MARK: - Objc
    @objc private func regionAction() {
        let vc = ProvinceViewController()
        vc.location = location
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func changeColer(tag: Int) {
        for region in regionButtons {
            region.backgroundColor = region.tag == tag ? .blue : .white
        }
    }
    
    // MARK: - IBAction
    @IBAction private func changeColorButtonTouchUpInside(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        location?.region = sender.tag
    }
}
