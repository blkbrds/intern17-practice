//
//  Bai2ViewModel.swift
//  TableView
//
//  Created by luong.tran on 28/09/2022.
//

import Foundation
import UIKit

final class Bai2ViewModel {
    
    var contacts: [String] = []
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "contacts", withExtension: "plist"),
              let contactsData = NSArray(contentsOf: path) as? [String]
        else { return }
        contacts = contactsData
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return contacts.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = UITableViewCell()
        cellViewModel.textLabel?.text = "\(contacts[indexPath.row])"
        return cellViewModel
    }
    
}
