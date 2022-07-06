//
//  DistrictViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/1/22.
//

import UIKit

protocol DistrictViewControllerDelegate: AnyObject {
    func controller(_ controller: DistrictViewController, district: Int)
}

final class DistrictViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var districtTableView: UITableView!
    
    // MARK: - Properties
    var district: Int = 0
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "Huyện \(indexPath.row + 1)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .black
        let backgroundView = UIView()
        backgroundView.backgroundColor = .orange
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("huyen \(indexPath.row + 1)")
        district = indexPath.row + 1
    }
}
