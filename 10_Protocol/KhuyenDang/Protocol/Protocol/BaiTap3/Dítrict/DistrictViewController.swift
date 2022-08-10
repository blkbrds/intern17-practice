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
        case passDataDistrict(value: dataLocation)
    }
    var districts: [String] = ["Huyện 1", "Huyện 2","Huyện 3","Huyện 4","Huyện 5", "Huyện 6", "Huyện 7", "Huyện 8", "Huyện 9", "Huyện 10"]
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
        let valueDistrict = dataLocation(district: district)
        delegate?.controller(self, needPerformAction: .passDataDistrict(value: valueDistrict))
    }
}

// MARK: - Extension
extension DistrictViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = districts[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.selectionStyle = .none
        let selectedIndex = districts.firstIndex(of: district)
        cell.backgroundColor = indexPath.row == selectedIndex ? .orange : .white
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
        district =  districts[indexPath.row]
    }
}
