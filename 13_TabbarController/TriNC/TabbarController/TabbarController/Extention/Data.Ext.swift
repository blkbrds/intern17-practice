//
//  Data.Ext.swift
//  TabbarController
//
//  Created by tri.nguyen on 11/05/2022.
//

import Foundation

typealias JSON = [String: Any]

extension Data {
    
    func toJSON() -> JSON {
        var json: [String: Any] = [:]
        do {
            if let jsonObjc = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JSON {
                json = jsonObjc
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
}
