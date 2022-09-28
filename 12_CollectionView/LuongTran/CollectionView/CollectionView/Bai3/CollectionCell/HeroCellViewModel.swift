//
//  HeroCellViewModel.swift
//  CollectionView
//
//  Created by luong.tran on 27/09/2022.
//

import Foundation
import UIKit

final class HeroCellViewModel {
    
    var avatar: UIImage
    var name: String
    var status: Status
    
    init(avatar: UIImage, name: String, status: Status) {
        self.avatar = avatar
        self.name = name
        self.status = status
    }
    
}
