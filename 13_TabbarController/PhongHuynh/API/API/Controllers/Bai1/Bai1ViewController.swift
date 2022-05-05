import UIKit

struct RevolutionsResponse {
    let count: Int?
    let previous: String?
    let results: [[String: Any]]?
    let next: String?
}

class Bai1ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var revolutions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        loadAPI {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    func loadAPI(completion: @escaping () -> Void) {
        //create request
        guard let url = URL(string: "https://pokeapi.co/api/v2/evolution-chain/") else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, responds, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                let response = RevolutionsResponse(count: json["count"] as? Int, previous: json["previous"] as? String, results: json["results"] as? [[String: Any]], next: json["next"] as? String)
                guard let results = response.results else {
                    self.revolutions = []
                    return
                }
                var revolutions: [String] = []
                for result in results {
                    if let revolution = result["url"] as? String {
                        revolutions.append(revolution)
                    }
                }
                self.revolutions = revolutions
            }
            completion()
        }
        task.resume()
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

extension Bai1ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        revolutions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(revolutions[indexPath.row])"
        return cell
    }
}
