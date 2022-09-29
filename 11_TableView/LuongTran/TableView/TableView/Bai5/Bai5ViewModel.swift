//
//  Bai5ViewModel.swift
//  TableView
//
//  Created by luong.tran on 28/09/2022.
//

import Foundation
import UIKit

final class Bai5ViewModel {
    
    var contactsData: [String] = []
    var contacts: [String] = []
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "contacts", withExtension: "plist"),
              let data = NSArray(contentsOf: path) as? [String]
        else { return }
        contactsData = data
        contacts = contactsData
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = UITableViewCell()
        cellViewModel.textLabel?.text = "\(contacts[indexPath.row])"
        return cellViewModel
    }
    
}
