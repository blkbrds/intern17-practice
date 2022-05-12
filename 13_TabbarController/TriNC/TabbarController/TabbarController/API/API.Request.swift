//
//  API.Request.swift
//  TabbarController
//
//  Created by tri.nguyen on 12/05/2022.
//

import UIKit

extension API {
    
    func request(urlString: String, completion: @escaping (APIResult) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }.resume() // connect
    }
}
