//
//  Bai10ViewModel.swift
//  TableView
//
//  Created by luong.tran on 28/09/2022.
//

import Foundation
import UIKit

final class Bai10ViewModel {
    
    var contactsData: [String] = []
    var contacts: [String] = []
    var arrayListIndex: [String: [String]] = [:]
    var arraySectionTitles: [String] = []
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "contacts", withExtension: "plist"),
              let data = NSArray(contentsOf: path) as? [String]
        else { return }
        contactsData = data
        contacts = contactsData
        getFirstCharacter(array: contactsData)
    }
    
    func getFirstCharacter(array: [String]) {
        for element in array {
            let elementKey = String(element.prefix(1))
            if var elementValues = arrayListIndex[elementKey] {
                elementValues.append(element)
                arrayListIndex[elementKey] = elementValues
            } else {
                arrayListIndex[elementKey] = [element]
            }
        }
        arraySectionTitles = Array(arrayListIndex.keys)
        arraySectionTitles = arraySectionTitles.sorted(by: { $0 < $1 })
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = UITableViewCell()
        let elementKey = arraySectionTitles[indexPath.section]
        if let elementValues = arrayListIndex[elementKey] {
            cellViewModel.textLabel?.text = "\(elementValues[indexPath.row])"
        }
        return cellViewModel
    }
    
}
