//
//  SuperHeroesVC.swift
//  CollectionView
//
//  Created by luong.tran on 20/09/2022.
//

import Foundation
import UIKit

enum Status {
    case standard
    case small
    
    var itemSize: CGSize {
        switch self {
        case .standard:
            return CGSize(width: 150, height: 180)
        case .small:
            return CGSize(width: 80, height: 80)
        }
    }
    
    var sectionInset: UIEdgeInsets {
        switch self {
        case .standard:
            return UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        case .small:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    var headerReferenceSize: CGSize {
        switch self {
        case .standard:
            return CGSize(width: 400, height: 80)
        case .small:
            return CGSize(width: 400, height: 40)
        }
    }
    
    var footerReferenceSize: CGSize {
        switch self {
        case .standard:
            return CGSize(width: 400, height: 40)
        case .small:
            return CGSize(width: 400, height: 30)
        }
    }
}
