//
//  RealmManager.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/10/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import Foundation
import RealmSwift

typealias DoneInform = (Bool) -> Void

final class RealmManager {

    static private var share = RealmManager()
    
    private init() { }

    static func shared() -> RealmManager {
        return share
    }

    func addVideo(with video: FavoriteVideo, completion: DoneInform) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(video)
                completion(true)
            }
        } catch {
            completion(false)
        }
    }

    func removeVideo(with id: String, completion: DoneInform) {
        do {
            let realm = try Realm()
            try realm.write {
                if let removeObject = realm.object(ofType: FavoriteVideo.self,
                                                   forPrimaryKey: "\(id)") {
                    realm.delete(removeObject)
                    completion(true)
                }
            }
        } catch {
            print("error", error)
            completion(false)
        }
    }

    func checkVideoIsFavo(with id: String, completion: DoneInform ) {
        do {
            let realm = try Realm()
            try realm.write {
                let object = realm.object(ofType: FavoriteVideo.self, forPrimaryKey: "\(id)")
                if object != nil {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        } catch {
            completion(false)
        }
    }
}
