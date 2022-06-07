//
//  Item.swift
//  CollectionView
//
//  Created by tri.nguyen on 16/05/2022.
//

import UIKit


final class Item {
    
    // MARK: - Properties
    var number: String
    
    // init
    init(number: String) {
        self.number = number
    }
}

// MARK: - Dummy Data
extension Item {
    static func getDummyData() -> [Item] {
        var items: [Item] = []
        for i in 0...10 {
            let item = Item(number: "\(i)")
            items.append(item)
        }
        return items
    }
}
