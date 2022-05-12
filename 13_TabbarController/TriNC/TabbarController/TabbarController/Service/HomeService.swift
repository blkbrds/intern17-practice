//
//  HomeService.swift
//  TabbarController
//
//  Created by tri.nguyen on 12/05/2022.
//

import Foundation

final class HomeService {

    // MARK: - GetMusic
    class func getMusicDetail(urlString: String, completion: @escaping ([Music]?) -> Void) {
            API.shared().request(urlString: urlString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    var musicResults: [Music] = []
                    if let data = data {
                        /// Option 1
//                        do {
//                            let jsonDecoder = JSONDecoder()
//                            let music = try jsonDecoder.decode(Music.self, from: data)
//                            completion(music)
//                        } catch {
//                            print("JSON casting error")
//                        }
                        
                        /// Option 2
                        let jsonObject = data.toJSON()
                        if let feed = jsonObject["feed"] as? JSON, let results = feed["results"] as? [JSON] {
                            for item in results {
                                let music = Music(json: item)
                                musicResults.append(music)
                            }
                        }
                        completion(musicResults)
                    } else {
                        completion(nil)
                    }
                case .failure:
                    completion(nil)
                }
            }
        }
    }
}
