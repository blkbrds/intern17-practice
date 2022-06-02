//
//  Detailbai9ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/23/22.
//

import UIKit

final class Detailbai9ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Property
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = name
        nameLabel.textColor = .red
    }
}
