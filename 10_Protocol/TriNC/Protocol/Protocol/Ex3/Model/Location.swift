//
//  Location.swift
//  Protocol
//
//  Created by tri.nguyen on 22/04/2022.
//

import Foundation

final class Location {
    
    // MARK: - Properties
    var region: Int
    var province: Int
    var district: Int
    
    init(region: Int, province: Int, district: Int) {
        self.region = region
        self.province = province
        self.district = district
    }
}
