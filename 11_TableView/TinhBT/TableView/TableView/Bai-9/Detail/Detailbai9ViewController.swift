//
//  Detailbai9ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/23/22.
//

import UIKit

final class Detailbai9ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = name
        nameLabel.textColor = .red
    }
}
