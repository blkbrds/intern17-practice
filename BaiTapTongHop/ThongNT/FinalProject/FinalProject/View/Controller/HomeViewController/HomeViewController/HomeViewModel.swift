//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/20/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation

final class HomViewModel {

    var video: Videos?

    func api(completion: @escaping (Error?) -> Void) {
        Youtube.loadAPI { [weak self] result in
            switch result {
            case .success(let data):
                self?.video = data
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }

    func getSnippet(with index: Int) -> Snippet? {
        guard let video = video else { return nil }
        guard index >= 0, index < video.items.count else { return nil }
        return video.items[index]
    }
}
