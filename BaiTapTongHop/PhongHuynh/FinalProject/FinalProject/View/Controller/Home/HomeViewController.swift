import UIKit

struct RevolutionsResponse {
    let kind: String?
    let etag: String?
    let items: [[String: Any]]?
}

class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

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
        guard let url = URL(string: "https://youtube.googleapis.com/youtube/v3/videos?chart=mostPopular&regionCode=VN&key=AIzaSyAyq-43C82gfhfPg7q3I3QrOSLR152V_40") else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, responds, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                let response = RevolutionsResponse(kind: json["kind"] as? String, etag: json["etag"] as? String, items: json["items"] as? [[String: Any]])
                guard let items = response.items else {
                    self.revolutions = []
                    return
                }
                var revolutions: [String] = []
                for items in items {
                    if let revolution = items["kind"] as? String {
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

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        revolutions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(revolutions[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200
    }
}
