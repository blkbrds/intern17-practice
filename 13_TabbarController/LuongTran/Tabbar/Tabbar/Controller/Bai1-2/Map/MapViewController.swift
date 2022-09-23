//
//  MapViewController.swift
//  Tabbar
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    private func configNavigation() {
        title = Define.title
    }
}

extension MapViewController {
    private struct Define {
        static var title: String = "Map"
    }
}
