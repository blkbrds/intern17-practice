//
//  CoordinatorNavigation.swift
//  Tabbar
//
//  Created by luong.tran on 22/09/2022.
//

import UIKit

enum Event {
    case accessRegister
}

protocol Coordinator {
    var childCoordinators: [Coordinator]? { get set }
    var navigationController: UINavigationController? { get set }

    func eventOccurred(with type: Event)
    
    func start()
}

protocol Coordinating {
    var coodinator: Coordinator? { get set }
}
