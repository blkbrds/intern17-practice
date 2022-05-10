//
//  MyPin.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/6/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import MapKit

final class MyPin: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D

    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }

    var subtitle: String? {
        return locationName
    }
}
