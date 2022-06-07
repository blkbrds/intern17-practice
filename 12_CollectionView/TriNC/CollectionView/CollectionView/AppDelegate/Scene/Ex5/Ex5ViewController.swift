//
//  Ex5ViewController.swift
//  CollectionView
//
//  Created by tri.nguyen on 11/05/2022.
//

import UIKit

final class Ex5ViewController: UIViewController {
    
    // MARK: - Enum
    enum Identifier: String {
        case ex5Cell = "Ex5TableViewCell"
        case slideCell = "SlideTableViewCell"
    }
    
    // MARK: - Properties
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - UI
    private func configUI() {
        title = "Ex5"
        // register
        let ex5Nib = UINib(nibName: Identifier.ex5Cell.rawValue, bundle: .main)
        tableView.register(ex5Nib, forCellReuseIdentifier: Identifier.ex5Cell.rawValue)
        let slideCell = UINib(nibName: Identifier.slideCell.rawValue, bundle: .main)
        tableView.register(slideCell, forCellReuseIdentifier: Identifier.slideCell.rawValue)
        
        // delegate && datasource
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Extention
extension Ex5ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.slideCell.rawValue, for: indexPath) as? SlideTableViewCell ?? UITableViewCell()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.ex5Cell.rawValue, for: indexPath) as? Ex5TableViewCell ?? UITableViewCell()
            return cell
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
