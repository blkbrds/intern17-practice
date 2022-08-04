//
//  BaiTap4ViewController.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/7/22.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUITableView()
    }
    
    // MARK: - Private method
    private func configUITableView() {
        let nib1 = UINib(nibName: "BT4TableViewCell", bundle: .main)
        tableView.register(nib1, forCellReuseIdentifier: "BT4TableViewCell")
        let nib = UINib(nibName: "BaiTap4TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "BaiTap4TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
    }
}

// MARK: - UITableViewDataSource
extension BaiTap4ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BT4TableViewCell", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BaiTap4TableViewCell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        default:
            return "TAG \(section)"
        }
    }
}

extension BaiTap4ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            let height = UIScreen.main.bounds.height / 4
            return height
        default:
            let height = UIScreen.main.bounds.height / 6
            return height
        }
    }
}
