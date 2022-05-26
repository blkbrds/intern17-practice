//
//  ContactDetailViewController.swift
//  BTTableView
//
//  Created by Tuan Tran V. VN.Danang on 5/26/22.
//

import UIKit

final class ContactDetailViewController: UIViewController {
    var contactName = ""
    //MARK: - IBOutlets
    @IBOutlet private weak var contactLabel: UILabel!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contactLabel.text = contactName
    }
}
