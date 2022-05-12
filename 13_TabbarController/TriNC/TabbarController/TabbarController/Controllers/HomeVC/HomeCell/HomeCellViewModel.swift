//
//  HomeCellViewModel.swift
//  TabbarController
//
//  Created by tri.nguyen on 12/05/2022.
//

import Foundation

final class HomeCellViewModel {
    
    // MARK: - Properties
    var music: Music
    var imageData: Data?
    
    init(music: Music) {
        self.music = music
    }
    
    func loadImage(completion: @escaping () -> Void) {
        PhotoManager.shared.downloadImage(with: music.artworkUrl100) { [weak self] data in
            guard let this = self else {
                completion()
                return
            }
            this.imageData = data
            completion()
        }
    }
}
