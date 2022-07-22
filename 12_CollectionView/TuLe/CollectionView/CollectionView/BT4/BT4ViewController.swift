import UIKit

final class BT4ViewController: UIViewController {
    
    @IBOutlet private weak var homeTableView: UITableView!
    
    private let headerCell: String = "headerTableViewCell"
    private let itemCell: String = "ItemTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewCell()
        title = "Home"
    }
    
    private func configTableViewCell() {
        let nib = UINib(nibName: "HeaderTableViewCell", bundle: Bundle.main)
        let nib2 = UINib(nibName: "ItemTableViewCell", bundle: Bundle.main)
        homeTableView.register(nib, forCellReuseIdentifier: headerCell)
        homeTableView.register(nib2, forCellReuseIdentifier: itemCell)
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
        homeTableView.allowsSelection = false
    }
}

extension BT4ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: headerCell, for: indexPath) as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            cell.updateCell()
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: itemCell, for: indexPath) as? ItemTableViewCell else {
                return UITableViewCell()
            }
            cell.updateCell(name: "#Tag\(indexPath.row)")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            let height = UIScreen.main.bounds.height / 4
            return height
        default:
            let height = UIScreen.main.bounds.height / 5
            return height
        }
    }
}
