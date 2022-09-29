//
//  Bai7ViewModel.swift
//  TableView
//
//  Created by luong.tran on 28/09/2022.
//

import Foundation
import UIKit

final class Bai7ViewModel {
    
    var arrayList: [[String]] = []
    var arrayListIndex: [String: [String]] = [:]
    var arraySectionTitles: [String] = []
    
    func loadData() {
        let giaSuc: [String] = ["Heo", "Bò", "Trâu", "Ngựa", "Gà", "Vịt", "Cá"]
        let doVat: [String] = ["Tivi", "Dao", "Kéo", "Xe", "Chén", "Bát", "Kèn", "Búa", "Đinh"]
        let hoa: [String] = ["Hoa Hồng", "Hoa Mai", "Hoa Đào"]
        
        self.arrayList = [giaSuc, doVat, hoa]
        for array in arrayList {
            for element in array {
                let elementKey = String(element.prefix(1))
                if var elementValues = arrayListIndex[elementKey] {
                    elementValues.append(element)
                    arrayListIndex[elementKey] = elementValues
                } else {
                    arrayListIndex[elementKey] = [element]
                }
            }
        }
        arraySectionTitles = Array(arrayListIndex.keys)
        arraySectionTitles = arraySectionTitles.sorted(by: { $0 < $1 })
    }
    
    func createSubTextCell() -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 25, width: 160, height: 30)
        label.text = "Test"
        label.textColor = .red
        label.font = label.font.withSize(13)
        return label
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = UITableViewCell()
        let elementKey = arraySectionTitles[indexPath.section]
        if let elementValues = arrayListIndex[elementKey] {
            cellViewModel.textLabel?.text = elementValues[indexPath.row]
            cellViewModel.contentView.addSubview(createSubTextCell())
            //add detail
//            cellViewModel.detailTextLabel?.text = "Test"
        }
        return cellViewModel
    }
    
}
