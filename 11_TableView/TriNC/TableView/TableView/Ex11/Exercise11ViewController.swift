//
//  Exercise11ViewController.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

final class Exercise11ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        title = "Auto"
        tableView.register(UINib(nibName: "ContentCell", bundle: nil), forCellReuseIdentifier: "ContentCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Extention UITableViewDataSource
extension Exercise11ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as? ContentCell else { return UITableViewCell() }
        cell.config(text: Constants.array[indexPath.row])
        return cell
    }
}

extension Exercise11ViewController {
    struct Constants {
        static let textOne: String = "abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc "
        static let textTwo: String = "abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc "
        static let array = ["abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc ", "abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc ", "jhsakja skajsdhkajsdbas dklashdjkajsd", "abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc c abc abc abc abc abc abc abc abc abc abc abc abc abc c abc abc abc abc abc abc abc abc abc abc abc abc abc c abc abc abc abc abc abc abc abc abc abc abc abc abc c abc abc abc abc abc abc abc abc abc abc abc abc abc c abc abc abc abc abc abc abc abc abc abc abc abc abc c abc abc abc abc abc abc abc abc "]
    }
}
