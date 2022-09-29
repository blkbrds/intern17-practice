//
//  Bai12ViewModel.swift
//  TableView
//
//  Created by luong.tran on 28/09/2022.
//

import Foundation
import UIKit

final class Bai12ViewModel {
    
    var numbers: [String] = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    var newNumbers: [String] = ["Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen"]
    var selectedItems: [Int] = []
    
    func viewModelForItem(at indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = UITableViewCell()
        if let id = numbers[safe: indexPath.row] {
            cellViewModel.textLabel?.text = "Number \(id)"
            if selectedItems.contains(indexPath.row) {
                cellViewModel.accessoryType = .checkmark
            } else {
                cellViewModel.accessoryType = .none
            }
        }
        return cellViewModel
    }
    
    func updateArray(data: String) {
        numbers.append(data)
    }
    
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

