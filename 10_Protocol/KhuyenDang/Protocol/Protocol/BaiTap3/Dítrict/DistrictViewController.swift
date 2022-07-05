//
//  DistrictViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/1/22.
//

import UIKit

protocol DistrictViewControllerDelegate: AnyObject {
    func controller(_ controller: DistrictViewController, needPerformAction action: DistrictViewController.Action )
}

final class DistrictViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var districtTableView: UITableView!
    
    // MARK: - Properties
    enum Action {
        case passDataDistrict(district: String)
    }
    weak var delegate: DistrictViewControllerDelegate?
    var district: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Private method
    private func configTableView() {
        title = "Huyện"
        districtTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        districtTableView.dataSource = self
        districtTableView.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneDistrict))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    // MARK: - Objc
    @objc private func handleDoneDistrict(){
        delegate?.controller(self, needPerformAction: .passDataDistrict(district: district))
    }
}
// MARK: - Extension
extension DistrictViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "Huyện \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = .orange
        cell.selectedBackgroundView = backgroundColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        district =  "Huyện \(indexPath.row + 1)"
    }
}
