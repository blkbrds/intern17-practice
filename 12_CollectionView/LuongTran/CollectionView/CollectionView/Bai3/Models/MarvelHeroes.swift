//
//  MarvelHeroes.swift
//  CollectionView
//
//  Created by luong.tran on 19/09/2022.
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
        case .avengers:
            return "Avengers"
        case .guardians:
            return "Guardians of the galaxy"
        case .xmen:
            return "Xmen"
        }
    }
    
    var teamAvatar: UIImage {
        switch self {
        case .avengers:
            return UIImage(named: "avenger")!
        case .guardians:
            return UIImage(named: "guardian")!
        case .xmen:
            return UIImage(named: "xmen")!
        }
    }
    
    var members: [Member] {
        switch self {
        case .avengers:
            return [Member(name: "Thor", avatar: UIImage(named: "thor")!),
                                 Member(name: "Captain American", avatar: UIImage(named: "captain")!),
                                 Member(name: "Iron Man", avatar: UIImage(named: "ironman")!),
                                 Member(name: "Haweye", avatar: UIImage(named: "haweye")!),
                                 Member(name: "Hulk", avatar: UIImage(named: "hulk")!)]
        case .guardians:
            return [Member(name: "Star lord", avatar: UIImage(named: "star")!),
                                     Member(name: "Rocket racoon", avatar: UIImage(named: "rocket")!),
                                     Member(name: "Gamora", avatar: UIImage(named: "gamora")!),
                                     Member(name: "Drax", avatar: UIImage(named: "drax")!),
                                     Member(name: "Groot", avatar: UIImage(named: "groot")!)]
        case .xmen:
            return [Member(name: "Storm", avatar: UIImage(named: "storm")!),
                                     Member(name: "Beast", avatar: UIImage(named: "beast")!),
                                     Member(name: "Wolverine", avatar: UIImage(named: "wolverine")!)]
        }
    }
    static var count: Int { return 3 }
}
