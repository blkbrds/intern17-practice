import UIKit

class User {
    
    var avatar: String
    var name: String
    var date: String
    
    init(avatar: String, name: String, date: String) {
        self.avatar = avatar
        self.name = name
        self.date = date
    }
}

final class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var users: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
    
    }
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.updateTableCell(avatar: "husky", name: "name", date: "date")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}
