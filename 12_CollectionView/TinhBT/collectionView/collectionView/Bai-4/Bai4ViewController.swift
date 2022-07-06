//
//  Bai4ViewController.swift
//  collectionView
//
//  Created by Tinh Bui T. VN.Danang on 5/30/22.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewCell()
    }
    
    // MARK: - Private functions
    private func configTableViewCell() {
        let nib = UINib(nibName: "CollectionTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CollectionTableViewCell")
        
        let nib2 = UINib(nibName: "Collection2TableViewCell", bundle: Bundle.main)
        tableView.register(nib2, forCellReuseIdentifier: "Collection2TableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension Bai4ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "Collection2TableViewCell", for: indexPath) as? Collection2TableViewCell else { return UITableViewCell() }
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else {
            return 150
        }
    }
}
