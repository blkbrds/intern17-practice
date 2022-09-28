//
//  Bai1ViewModel.swift
//  CollectionView
//
//  Created by luong.tran on 27/09/2022.
//

import Foundation

final class Bai1ViewModel {
    
    func viewModelForItem(at indexPath: IndexPath) -> Bai1CellViewModel {
        let cellViewModel = Bai1CellViewModel(number: (indexPath.row + 1))
        return cellViewModel
    }
}
