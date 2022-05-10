//
//  MapViewControllerModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/6/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import MapKit

enum PinColorStyle {
    case source
    case destination
}

enum OverlayType {
    case polyline
    case circle
}

final class MapViewControllerModel {

    private var destinationCoordinate: CLLocationCoordinate2D?
    private var source: CLLocationCoordinate2D?

    func getDestinationCoordinate() -> CLLocationCoordinate2D? {
        return destinationCoordinate
    }

    func setDestinationCoordinate(with coordinate: CLLocationCoordinate2D) {
        self.destinationCoordinate = coordinate
    }

    func getSourceCoordinate() -> CLLocationCoordinate2D? {
        return source
    }

    func getCurrentLocation(completion: @escaping LocationCompletion) {
        LocationManager.shared().getCurrentLocation { [weak self] location in
            completion(location)
            self?.source = location.coordinate
        }
    }

    func updatingLocation(completion: @escaping LocationCompletion) {
        LocationManager.shared().startUpdating { [weak self] _ in
            self?.getCurrentLocation(completion: completion)
        }
    }
}
