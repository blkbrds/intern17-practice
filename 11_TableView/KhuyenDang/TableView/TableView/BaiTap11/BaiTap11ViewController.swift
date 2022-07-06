//
//  BaiTap11ViewController.swift
//  TableView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/6/22.
//

import UIKit

final class BaiTap11ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var data: [String] = []

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromPlist()
        configUITableView()
    }

    // MARK: - Private method
    private func configUITableView() {
        let nib = UINib(nibName: "CustomLabelTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "CustomLabelTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func getDataFromPlist() {
        guard let path = Bundle.main.url(forResource: "Data11", withExtension: "plist") else { return}
        guard let textData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        data = textData
    }
}

// MARK: - Extension
extension BaiTap11ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomLabelTableViewCell", for: indexPath) as! CustomLabelTableViewCell
        cell.updateTableCell(value: data[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension BaiTap11ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
