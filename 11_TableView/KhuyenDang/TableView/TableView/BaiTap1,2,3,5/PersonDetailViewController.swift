//
//  PersonDetailViewController.swift
//  TableView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/6/22.
//

import UIKit

final class PersonDetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUIDetail()
    }
    
    // MARK: - Private method
    private func configUIDetail() {
        title = "DETAIL"
        nameLabel.text = name
    }
}
