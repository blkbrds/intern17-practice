//
//  DetailViewController.swift
//  TableView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/6/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK:  - IBOutlet
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: Propertie
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
    }
    
    // MARK: - Private functions
    private func configViewController() {
        title = "Detail"
        nameLabel.text = name
    }
}
