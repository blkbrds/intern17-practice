//
//  Bai9ViewModel.swift
//  TableView
//
//  Created by luong.tran on 28/09/2022.
//

import Foundation
import UIKit

final class Bai9ViewModel {
    
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
        arraySectionTitles = [String](arrayListIndex.keys)
        arraySectionTitles = arraySectionTitles.sorted(by: { $0 < $1 })
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> Bai9CellViewModel {
        let elementKey = arraySectionTitles[indexPath.section]
        var cellViewModel: Bai9CellViewModel!
        if let elementValues = arrayListIndex[elementKey] {
            cellViewModel = Bai9CellViewModel(name: elementValues[indexPath.row], subTitle: "sub title")
        }
        return cellViewModel
    }
    
}
