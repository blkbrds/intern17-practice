import Foundation

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var email: String = ""
    var password: String = ""
    var names: [String] = []
    
    func loadAPI(completion: @escaping Completion) {
        //create request
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        //config
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        //session
        let session = URLSession(configuration: config)
        
        //connect
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let results = feed["results"] as! [JSON]
                        
                        for item in results {
                            let name = item["name"] as! String
                            self.names.append(name)
                        }
                        
                        completion(true, "")
                    } else {
                        completion(false, "Data format is error.")
                    }
                }
            }
        }
        
        task.resume()
        print("DONE")
    }
    
    func fetchData(completion: (Bool, String, String) -> ()) {
        let data = DataManager.shared().read()
        let email = data.0
        let password = data.1
        
        if email != "" || password != "" {
            //lưu trữ dữ liệu
            self.email = email
            self.password = password
            
            //callback
            completion(true, email, password)
        } else {
            //callback
            completion(false, "", "")
        }
    }
}
