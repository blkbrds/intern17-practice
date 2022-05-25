//
//  DetailViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/20/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = name
    }
}
