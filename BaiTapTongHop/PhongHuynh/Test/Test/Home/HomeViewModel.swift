import Foundation

final class HomeViewModel {
    
    // MARK: - Properties
    var users: [User] = User.getDummyDatas()
    var index: Int = 0
    
    func numberOfRowsInSection() -> Int {
        return users.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellViewModel {
        return HomeCellViewModel(user: users[indexPath.row])
    }
    
    func viewModelForDetail(at indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(user: users[indexPath.row])
    }
    
    func updateUser(user: User) {
        users[index] = user
    }
}

// MARK: - User
extension User {
    
    static func getDummyDatas() -> [User] {
        var users: [User] = []
        for i in 1...3 {
            let user = User(avatar: "husky", name: "Name \(i)", date: "01/01/1995")
            users.append(user)
        }
        return users
    }
}
