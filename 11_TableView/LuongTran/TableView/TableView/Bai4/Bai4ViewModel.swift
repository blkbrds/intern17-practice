//
//  Bai4ViewModel.swift
//  TableView
//
//  Created by luong.tran on 28/09/2022.
//

import Foundation
import UIKit

final class Bai4ViewModel {
    
    let section0: [String] = ["Mì", "Bí"]
    let section1: [String] = ["Heo", "Bò", "Trâu", "Ngựa", "Gà", "Vịt", "Cá"]
    let section2: [String] = ["Tivi", "Dao", "Kéo", "Remote"]
    var sections: [[String]] = []
    
    func loadData() {
        sections = [section0, section1, section2]
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = UITableViewCell()
        cellViewModel.textLabel?.text = sections[indexPath.section][indexPath.row]
        return cellViewModel
    }
    
}
