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
            let nib = UINib(nibName: "FeaturedVideoCell", bundle: Bundle.main)
            let nib2 = UINib(nibName: "NominationVideoCell", bundle: Bundle.main)
            tableView.register(nib, forCellReuseIdentifier: "FeaturedVideoCell")
            tableView.register(nib2, forCellReuseIdentifier: "NominationVideoCell")
            tableView.dataSource = self
            tableView.delegate = self
        }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedVideoCell") as? FeaturedVideoCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "NominationVideoCell") as? NominationVideoCell else { return UITableViewCell() }
            return cell2
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        return 150
    }
}
