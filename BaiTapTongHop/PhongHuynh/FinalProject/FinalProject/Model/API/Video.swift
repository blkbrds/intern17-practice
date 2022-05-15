import Foundation
import UIKit

typealias JSON = [String: Any]

final class Video {

    // MARK: - Properties
    var id: String?
    var imageURL: String?
    var title: String?
    var description: String?

    // MARK: - Init
    init(json: JSON) {
        if let id = json["id"] as? String,
           let snippet = json["snippet"] as? JSON,
           let title = snippet["title"] as? String,
           let description = snippet["description"] as? String,
           let thumbnails = snippet["thumbnails"] as? JSON,
           let medium = thumbnails["medium"] as? JSON,
           let imageURL = medium["url"] as? String {
            self.id = id
            self.title = title
            self.description = description
            self.imageURL = imageURL
        }
    }
}
