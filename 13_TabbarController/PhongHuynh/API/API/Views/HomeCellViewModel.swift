import Foundation
import UIKit

final class HomeCellViewModel {
    var users: User
    
    init( users: User) {
        self.users = users
    }
    
    func updateImageView(completion: @escaping (UIImage?) -> Void) {
        Networking.shared().downloadImage(url: users.avatar) { (image) in
            completion(image)
        }
    }
}
