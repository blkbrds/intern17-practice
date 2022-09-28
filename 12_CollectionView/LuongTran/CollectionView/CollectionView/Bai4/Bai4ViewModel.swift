//
//  Bai4ViewModel.swift
//  CollectionView
//
//  Created by luong.tran on 28/09/2022.
//

import Foundation
import UIKit

final class Bai4ViewModel {
    
    var imagesSlide: [String] = ["avenger", "guardian", "xmen"]
    
    func numberOfItemsInSection(in section: Int) -> Int {
        return imagesSlide.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> ImageCellViewModel {
        guard let imageSlide = UIImage(named: imagesSlide[indexPath.row]) else { return ImageCellViewModel(imageSlide: UIImage()) }
        let cellViewModel = ImageCellViewModel(imageSlide: imageSlide)
        return cellViewModel
    }
    
}
