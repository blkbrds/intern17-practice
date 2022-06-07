//
//  Member.swift
//  CollectionView
//
//  Created by tri.nguyen on 03/05/2022.
//

import Foundation
import UIKit

struct Member {
    let name: String
    let avatar: UIImage
}

enum Team: Int {
    
    case avengers
    case guardians
    case xmen
    
    var teamName: String {
        switch self {
        case .avengers: return "iOS"
        case .guardians: return "Fluter"
        case .xmen: return "Web"
        }
    }
        
    var teamAvatar: UIImage {
        switch self {
        case .avengers: return #imageLiteral(resourceName: "ic-i11")
        case .guardians: return #imageLiteral(resourceName: "ic-i2")
        case .xmen: return #imageLiteral(resourceName: "ic-i11")
        }
    }
    
    var members: [Member] {
        switch self {
        case .avengers: return [
            Member(name: "Thor", avatar: #imageLiteral(resourceName: "ic-i8")),
            Member(name: "Captain", avatar: #imageLiteral(resourceName: "ic-i1")), Member(name: "Iron man", avatar: #imageLiteral(resourceName: "ic-i1")),
            Member(name: "Black", avatar: #imageLiteral(resourceName: "ic-i8")),
            Member(name: "Haweye", avatar: #imageLiteral(resourceName: "ic-i5")), Member(name: "Hulk", avatar: #imageLiteral(resourceName: "ic-i9")),
            Member(name: "Thor", avatar: #imageLiteral(resourceName: "ic-i8")),
            Member(name: "Captain", avatar: #imageLiteral(resourceName: "ic-i1")), Member(name: "Iron man", avatar: #imageLiteral(resourceName: "ic-i10")),
            Member(name: "Black ", avatar: #imageLiteral(resourceName: "ic-i8")),
            Member(name: "Haweye", avatar: #imageLiteral(resourceName: "ic-i5")), Member(name: "Hulk", avatar: #imageLiteral(resourceName: "ic-i9"))
        ]
        case .guardians: return [
            Member(name: "Star lord", avatar: #imageLiteral(resourceName: "ic-i3")), Member(name: "Rocket", avatar: #imageLiteral(resourceName: "ic-i4")),
            Member(name: "Gamora", avatar: #imageLiteral(resourceName: "ic-i10")),
            Member(name: "Drax", avatar: #imageLiteral(resourceName: "ic-i4")), Member(name: "Groot", avatar: #imageLiteral(resourceName: "ic-i7")),
            Member(name: "Thor", avatar: #imageLiteral(resourceName: "ic-i8")),
            Member(name: "Cap", avatar: #imageLiteral(resourceName: "ic-i1")), Member(name: "Iron man", avatar: #imageLiteral(resourceName: "ic-i1"))
        ]
        case .xmen: return [
            Member(name: "Storm", avatar: #imageLiteral(resourceName: "ic-i4")),
            Member(name: "Beast", avatar: #imageLiteral(resourceName: "ic-i1")),
            Member(name: "Wolverine", avatar: #imageLiteral(resourceName: "ic-i5"))
        ]
        }
    }
    static var count: Int { return Team.xmen.rawValue + 1}
}
