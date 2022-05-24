//
//  FavoriteCell.swift
//  FinalProject
//
//  Created by Phong Huynh N. VN.Danang on 5/16/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

final class FavoriteCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var favoriteVideoImageView: UIImageView!
    @IBOutlet private weak var titleFavoriteVideoLabel: UILabel!

    var videos: [RealmVideo] = []
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateView(title: String) {
        titleFavoriteVideoLabel.text = title
    }

    @IBAction private func deleteData(_ sender: Any) {
        do {
        let realm = try Realm()
        let results = realm.objects(RealmVideo.self)
     //   videos = realm.objects(RealmVideo.self).toArray(ofType: RealmVideo.self)
        try realm.write {
            realm.delete(results)
        }
        } catch {
        }
    }
}
