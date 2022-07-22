import UIKit

final class BT1ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var cell: String = "tableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BT1ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        cell.textLabel?.text = "Name \(indexPath.row + 1)"
        return cell
    }
}


