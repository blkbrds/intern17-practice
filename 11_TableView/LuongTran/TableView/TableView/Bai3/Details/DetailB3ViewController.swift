//
//  DetailB3ViewController.swift
//  TableView
//
//  Created by luong.tran on 16/09/2022.
//

import UIKit

final class DetailB3ViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        nameLabel.text = userName
    }

}
