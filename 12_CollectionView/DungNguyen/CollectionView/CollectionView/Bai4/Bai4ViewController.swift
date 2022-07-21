//
//  Bai4ViewController.swift
//  CollectionView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/7/22.
//

import UIKit

final class Bai4ViewController: UIViewController {

    // MARK: - IBOulet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Private function
    private func configTableView() {
        let firstCellNib = UINib(nibName: "FirstTableViewCell", bundle: .main)
        tableView.register(firstCellNib, forCellReuseIdentifier: "FirstTableViewCell")
        let cellNib = UINib(nibName: "CustomCell", bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
    }
}

// MARK: - Extension
extension Bai4ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        default:
            return "Tag \(section)"
        }
    }
    
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
