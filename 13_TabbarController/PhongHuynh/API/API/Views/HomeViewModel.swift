import Foundation

class User {
    var name: String
    var avatar: String
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    
    var users: [User] = []
    var musics: [Music] = []
    
    func numberOfRowsInSection() -> Int {
        return users.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellViewModel {
        return HomeCellViewModel(users: users[indexPath.row])
    }
    
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    
                    for item in results {
                        let music = Music(json: item)
                        self.musics.append(music)
                        let name = item["name"] as! String
                        let avatar = item["artworkUrl100"] as! String
                        self.users.append(User(name: name, avatar: avatar))
                        completion(true, "")
                    }
                } else {
                    completion(false, "Data format is error.")
                }
            }
        }
    }
}
