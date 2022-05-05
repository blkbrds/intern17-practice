import UIKit

struct RevolutionsResponse {
    let count: Int?
    let previous: String?
    let results: [[String: Any]]?
    let next: String?
}

class Bai1ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func loadAPI(completion: @escaping () -> Void) {
        //create request
        guard let url = URL(string: Paths.evolutionChains) else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, responds, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                let response = RevolutionsResponse(count: json["count"] as? Int, previous: json["previous"] as? String, results: json["results"] as? [[String: Any]], next: json["next"] as? String)
                guard let results = response.results else {
                    
                }
            }
            var revolutions: [String] = []
            print(data ?? "")
            print(responds ?? "")
            print(error ?? "")
            completion()
        }
        task.resume()
        //        let url = URL(string: urlString)
        //        var request = URLRequest(url: url!)
        //        request.httpMethod = "GET"
        //
        //        //config
        //        let config = URLSessionConfiguration.ephemeral
        //        config.waitsForConnectivity = true
        //
        //        //session
        //        let session = URLSession(configuration: config)
        //
        //        //connect
        //        let task = session.dataTask(with: request) { (data, response, error) in
        //            DispatchQueue.main.async {
        //                if let error = error {
        //                    completion(false, error.localizedDescription)
        //                } else {
        //                    if let data = data {
        //                        let json = data.toJSON()
        //                        let feed = json["feed"] as! JSON
        //                        let results = feed["results"] as! [JSON]
        //
        //                        for item in results {
        //                            let name = item["name"] as! String
        //                            self.names.append(name)
        //                        }
        //
        //                        completion(true, "")
        //                    } else {
        //                        completion(false, "Data format is error.")
        //                    }
        //                }
        //            }
        //        }
        //
        //        task.resume()
        //        print("DONE")
    }
    
    func convertToJSON(from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
    
    
}
