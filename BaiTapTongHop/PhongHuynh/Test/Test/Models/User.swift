import Foundation

final class User {
    
    // MARK: - Properties
    var avatar: String
    var name: String
    var date: String
    
    // MARK : - Init
    init(avatar: String, name: String, date: String) {
        self.avatar = avatar
        self.name = name
        self.date = date
    }
}
