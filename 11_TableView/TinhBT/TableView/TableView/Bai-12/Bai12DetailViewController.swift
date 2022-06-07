//
//  Bai12DetailViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/24/22.
//

import UIKit

final class Bai12DetailViewController: UIViewController {
     
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = name
        nameLabel.textColor = .red
    }
}
