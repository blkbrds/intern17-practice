import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "NewVideoHomeCell", bundle: Bundle.main)
        let nib2 = UINib(nibName: "FeaturedVideoHomeCell", bundle: Bundle.main)
        let nib3 = UINib(nibName: "NominationVideoCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "NewVideoHomeCell")
        tableView.register(nib2, forCellReuseIdentifier: "FeaturedVideoHomeCell")
        tableView.register(nib3, forCellReuseIdentifier: "NominationVideoCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedVideoHomeCell") as? FeaturedVideoHomeCell else { return UITableViewCell() }
            return cell
        } else if indexPath.row == 1 {
            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: "NewVideoHomeCell") as? NewVideoHomeCell else { return UITableViewCell() }
            return cell1
        } else if indexPath.row == 2 {
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "NominationVideoCell") as? NominationVideoCell else { return UITableViewCell() }
            return cell2
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row <= 2 {
            return 300
        } else {
            return 0
        }
    }
}
