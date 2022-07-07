import UIKit

final class BT1ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = ""
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BT1ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = "Name \(indexPath.row + 1)"
        return cell
    }
    
    
}


