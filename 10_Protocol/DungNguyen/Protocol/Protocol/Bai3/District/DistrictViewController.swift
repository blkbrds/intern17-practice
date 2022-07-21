//
//  DistrictViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/1/22.
//

import UIKit

protocol DistrictViewControllerDelegate: AnyObject {
    func controller(_ controller: DistrictViewController, district: String)
}

final class DistrictViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var districtTableView: UITableView!
    
    // MARK: - Properties
    var districts: [String] = ["Huyện 1", "Huyện 2", "Huyện 3", "Huyện 4", "Huyện 5", "Huyện 6", "Huyện 7", "Huyện 8", "Huyện 9", "Huyện 10"]
    var district: String = ""
    weak var delegate: DistrictViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }

    // MARK: - Private functions
    private func configView(){
        title = "Huyện"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donetAction))
        navigationItem.rightBarButtonItem = doneButton
        districtTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        districtTableView.dataSource = self
        districtTableView.delegate = self
    }
    
    // MARK: - Objc functions
    @objc private func donetAction() {
        delegate?.controller(self, district: district)
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Extensions
extension DistrictViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = districts[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .black
        cell.selectionStyle = .none
        let selectionIndex = districts.firstIndex(of: district)
        cell.backgroundColor = indexPath.row == selectionIndex ? .orange : .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
        district = districts[indexPath.row]
    }
}
